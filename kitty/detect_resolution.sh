#!/bin/bash

echo "Script executed at $(date)" >> /tmp/kitty_debug.log

# Function to set font size
set_font_size() {
    local width=$1

    # Trim whitespace and ensure width is an integer
    width=$(echo "$width" | tr -d '[:space:]')
    if [[ "$width" =~ ^[0-9]+$ ]]; then
        if [ "$width" -ge 3840 ]; then
            kitty @ set-font-size 15
        else
            kitty @ set-font-size 14
        fi
    else
        echo "Error: Width is not an integer: $width"
        exit 1
    fi
}

# Detect OS
os=$(uname)

if [ "$os" == "Linux" ]; then
    # Linux: Use xrandr and wmctrl
    kitty_window_id=$(wmctrl -lx | grep kitty | awk '{print $1}')
    if [ -z "$kitty_window_id" ]; then
        echo "Error: Could not find Kitty window"
        exit 1
    fi
    window_geometry=$(xwininfo -id "$kitty_window_id" | grep "Absolute upper-left X" | awk '{print $4}')
    xrandr_output=$(xrandr --current | grep " connected" | awk -v geo="$window_geometry" '
    {
        split($0, arr, " ");
        output_name = arr[1];
        resolution = arr[3];
        split(resolution, res, "+");
        x_offset = res[2];
        y_offset = res[3];
        if (geo >= x_offset && geo < x_offset + res[1]) {
            print res[1];
            exit;
        }
    }')
    width=$xrandr_output

elif [ "$os" == "Darwin" ]; then
    # macOS: Use Aerospace to find Kitty's monitor
    kitty_monitor_num=""
    for monitor_num in {1..4}; do
        if aerospace list-windows --monitor "$monitor_num" | awk '{print $3}' | grep -q kitty; then
            kitty_monitor_num=$monitor_num
            echo "Found kitty on $monitor_num"
            break
        fi
    done

    if [ -z "$kitty_monitor_num" ]; then
        echo "Error: Could not find Kitty window on any monitor"
        exit 1
    fi

    # Extract resolution for the monitor with Kitty
    resolution=$(system_profiler SPDisplaysDataType | grep Resolution | head -n "$kitty_monitor_num" | tail -n 1 | awk '{print $2}')
    width=$resolution

elif [[ "$os" == CYGWIN* || "$os" == MINGW* || "$os" == MSYS* ]]; then
    # Windows: Use PowerShell
    resolution=$(powershell.exe -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width")
    width=$(echo "$resolution" | tr -d '\r')

else
    echo "Unsupported OS"
    exit 1
fi

# Debugging: Check width value
echo "Detected width for Kitty's monitor: '$width'"

# Set the font size based on resolution width
set_font_size "$width"
