---@diagnostic disable: missing-fields
-- enable keybinds only when lsp server available
local on_attach = require("util.lsp").on_attach

local config = function()
	-- Required for LSP
	require("neoconf").setup({})
	-- nvim-cmp -- Auto complete plugin
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = cmp_nvim_lsp.default_capabilities()
	-- LSP Config plugin
	local lspconfig = require("lspconfig")

	local diagnostic_signs = { Error = "ⓧ", Warn = "⚠", Hint = " ", Info = "ⓘ" }
	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.stdpath("config") .. "nvim/lua",
					},
				},
			},
		},
	})

	-- json
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "json", "jsonc" },
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- typescript
	lspconfig.vtsls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
      "javascript",
      "javascriptreact",
			"typescript",
      "typescriptreact",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	-- bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh" },
	})

  -- html
  lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html" },
  })

  -- css
  lspconfig.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "css" },
  })

  -- tailwindcss
  lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "html", 
        "javascriptreact",
        "typescriptreact"
    },
  })

	-- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"html",
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
			"vue",
		},
	})

	-- -- docker
	-- lspconfig.dockerls.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- })

  --  -- TEMPORARILY DISABLED LINTERS AND FORMATTERS
	-- efm provides configs for mason linters and formatters
	-- local luacheck = require("efmls-configs.linters.luacheck")
	-- local stylua = require("efmls-configs.formatters.stylua")
	-- local flake8 = require("efmls-configs.linters.flake8")
  -- flake8.lintCommand = flake8.lintCommand .. "-max-line-length 99 -"
	-- local black = require("efmls-configs.formatters.black")
	-- local eslint_d = require("efmls-configs.linters.eslint_d")
	-- local prettierd = require("efmls-configs.formatters.prettier_d")
	-- local fixjson = require("efmls-configs.formatters.fixjson")
	-- local shellcheck = require("efmls-configs.linters.shellcheck")
	-- local shfmt = require("efmls-configs.formatters.shfmt")
	-- local alex = require("efmls-configs.linters.alex")
	--
	-- -- configure efm server
	-- lspconfig.efm.setup({
	-- 	filetypes = {
	-- 		"lua",
	-- 		"python",
	-- 		"json",
	-- 		"jsonc",
	-- 		"sh",
	-- 		"javascript",
	-- 		"javascriptreact",
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 		"svelte",
	-- 		"vue",
	-- 		"markdown",
	-- 		-- "docker",
	-- 		-- "solidity",
	-- 	},
	-- 	init_options = {
	-- 		documentFormatting = true,
	-- 		documentRangeFormatting = true,
	-- 		hover = true,
	-- 		documentSymbol = true,
	-- 		codeAction = true,
	-- 		completion = true,
	-- 	},
	-- 	settings = {
	-- 		languages = {
	-- 			lua = { luacheck, stylua },
	-- 			python = { flake8, black },
	-- 			typescript = { eslint_d, prettierd },
	-- 			json = { eslint_d, fixjson },
	-- 			jsonc = { eslint_d, fixjson },
	-- 			sh = { shellcheck, shfmt },
	-- 			javascript = { eslint_d, prettierd },
	-- 			javascriptreact = { eslint_d, prettierd },
	-- 			typescriptreact = { eslint_d, prettierd },
	-- 			svelte = { eslint_d, prettierd },
	-- 			vue = { eslint_d, prettierd },
	-- 			markdown = { alex, prettierd },
	-- 			-- docker = { hadolint, prettierd },
	-- 			-- solidity = { solhint },
	-- 		},
	-- 	},
	-- })
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
    -- blink-cmp -- only dpendency
    -- "saghen/blink.cmp",
    -- nvim-cmp -- lsp-config dependencies
		"hrsh7th/nvim-cmp",
	},
}
