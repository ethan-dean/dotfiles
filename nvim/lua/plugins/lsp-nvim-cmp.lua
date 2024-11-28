return {
	"hrsh7th/nvim-cmp",
  lazy = false,
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

    -- luasnip allows defining custom shortcuts for boilerplate
    luasnip.filetype_extend('typescript', { 'javascript' })
    luasnip.filetype_extend('typescriptreact', { 'javascript' })
    luasnip.filetype_extend('javascriptreact', { 'javascript' })
    luasnip.filetype_extend('vue', { 'javascript' })
		require("luasnip/loaders/from_vscode").lazy_load()

		vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.confirm({ select = true }), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
        -- ":h nvim-cmp" for options to improve which sources show up
        -- group_index = number : lower number is higher priority for whole source
        -- max_item_count = number: max_words appearing from source
				-- ex) { name = "nvim_lsp", group_index = 1, max_item_count = 3 }, -- lsp
				{ name = "nvim_lsp", group_index = 1 }, -- lsp
				{ name = "buffer", group_index = 1 }, -- text within current buffer
				{ name = "luasnip", group_index = 2 }, -- snippets
				{ name = "path", group_index = 1 }, -- file system paths
			}),
			-- configure lspkind for vs-code like icons
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
	dependencies = {
    -- Little icons next to sources
		"onsails/lspkind.nvim",
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "2.*",
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" }
		},
    -- Completion engine for luasnip
    "saadparwaiz1/cmp_luasnip",
    -- Completion engines from nvim-cmp, nvim-cmp does not ship with all sources by default.
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
	},
}
