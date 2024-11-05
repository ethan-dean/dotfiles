return {
  'nvimdev/dashboard-nvim',
  -- event = 'VimEnter',
  config = function()
    -- local api = vim.api
    -- local keymap = vim.keymap
    local dashboard = require("dashboard")

    -- local conf = {}
    -- conf.header = {
    --   "                                                       ",
    --   "                                                       ",
    --   "                                                       ",
    --   " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    --   " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    --   " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    --   " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    --   " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    --   " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    --   "                                                       ",
    --   "                                                       ",
    --   "                                                       ",
    --   "                                                       ",
    -- }
    --
    -- conf.center = {
    --   {
    --     icon = "󰈞  ",
    --     desc = "Find File                               ",
    --     action = "Leaderf file --popup",
    --     key = "f",
    --   },
    --   {
    --     icon = "󰈢  ",
    --     desc = "Recently opened files                   ",
    --     action = "Leaderf mru --popup",
    --     key = "r",
    --   },
    --   {
    --     icon = "󰈬  ",
    --     desc = "Project grep                            ",
    --     action = "Leaderf rg --popup",
    --     key = "g",
    --   },
    --   {
    --     icon = "  ",
    --     desc = "Open Nvim config                        ",
    --     action = ":e ~/.config/nvim",
    --     key = "v",
    --   },
    --   {
    --     icon = "  ",
    --     desc = "New file                                ",
    --     action = "enew",
    --     key = "e",
    --   },
    --   {
    --     icon = "󰗼  ",
    --     desc = "Quit Nvim                               ",
    --     -- desc = "Quit Nvim                               ",
    --     action = "qa",
    --     key = "q",
    --   },
    -- }
    -- dashboard.setup({
    --   theme = 'doom',
    --   shortcut_type = 'number',
    --   config = conf
    -- })

    dashboard.setup({
      theme = 'hyper',
      disable_move = true,    --  default is false disable move keymap for hyper
      shortcut_type = 'letter',   --  shorcut type 'letter' or 'number'
      shuffle_letter = false, --  default is true, shortcut 'letter' will be randomize, set to false to have ordered letter.
      change_to_vcs_root = true, -- default is false,for open file in hyper mru. it will change to the root of vcs
      config = {
        header = {
              "                                                       ",
              "                                                       ",
              "                                                       ",
              " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
              " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
              " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
              " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
              " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
              " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
              "                                                       ",
              "                                                       ",
              "                                                       ",
              "                                                       ",
        },
        shortcut = {
          {
            desc = '󰊳 Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u'
          },
          {
            icon = ' ',
            icon_hl = 'Label',
            desc = 'Find Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = '☎ ',
            icon_hl = 'DiagnosticHint',
            desc = 'Grep Files',
            group = 'DiagnosticHint',
            action = 'Telescope live_grep',
            key = 'g',
          },
          {
            desc = ' Nvim Config',
            group = 'Number',
            action = ':e ~/.config/nvim/',
            key = 'i',
          },
          {
            desc = ' Dotfiles',
            group = '@property',
            action = ':e ~/.config/',
            key = 'd',
          },
        },
        packages = { enable = true }, -- show how many plugins neovim loaded
        -- limit how many projects list, action when you press key or enter it will run this action.
        -- action can be a functino type, e.g.
        -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
        project = {
          enable = true,
          limit = 8,
          icon = '󰏓',
          label = ' Recent Projects: ',
          -- action = 'Telescope find_files cwd='
          action = ':e '
        },
        mru = { limit = 10, icon = '', label = ' Most Recent Files: ', cwd_only = true },
        footer = {}, -- footer     },
      }
    })
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

