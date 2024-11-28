local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
      file_ignore_patterns = {
        "node_modules",
      },
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
				hidden = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-project.nvim",
      config = function()
          require("telescope").load_extension("project")
      end,
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
          require("telescope").load_extension("frecency")
      end,
    },
	},
	config = config,
	keys = {
    { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer search" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Ripgrep" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find All Files" },
    { "<leader>fl", "<cmd>Telescope lsp_references<cr>", desc = "Lsp References" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
    { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Registers" },
	},
}
