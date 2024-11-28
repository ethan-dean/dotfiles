return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  opts = {
    window = {
      position = "right",
      mappings = {
        ["Y"] = "none",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
        },
        always_show = {
          ".env",
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
          require 'window-picker'.setup({
              filter_rules = {
                  include_current_win = false,
                  autoselect_one = true,
                  -- filter using buffer options
                  bo = {
                      -- if the file type is one of following, the window will be ignored
                      filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                      -- if the buffer type is one of following, the window will be ignored
                      buftype = { 'terminal', "quickfix" },
                  },
          },
      })
      end,
    },
  }
}
