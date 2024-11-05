local config = function()
	local nf_palette = require("nightfox.palette").load("carbonfox")
	local custom_nightfox = require("lualine.themes.nightfox")
	custom_nightfox.normal.b.bg = nf_palette.bg0
  local custom_tokyonight = require("lualine.themes.tokyonight-night")
	custom_tokyonight.normal.c.bg = "#1a1c26"

	require("lualine").setup({
		options = {
			theme = custom_tokyonight,
			globalstatus = true,
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
			lualine_b = {
				"filename",
				"branch",
			},
			lualine_c = {
				-- "%=", --[[ add your center compoentnts here in place of this comment ]]
				{
					"diagnostics",
					source = { "nvim" },
					sections = { "error" },
					-- diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
				},
				{
					"diagnostics",
					source = { "nvim" },
					sections = { "warn" },
					-- diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
				},
			},
			lualine_x = {},
			-- lualine_y = { "filetype", "progress" },
			lualine_y = { "filetype" },
			lualine_z = {
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
