local mapkey = require("util.func-keymap").mapvimkey

local M = {}

M.on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- set keybinds
	-- mapkey("<leader>fd", "Lspsaga finder", "n", opts) -- go to definition
	mapkey("<leader>gd", "Lspsaga goto_definition", "n", opts) -- go to definition
	mapkey("<leader>gD", "Lspsaga peek_definition", "n", opts) -- peek definition
	mapkey("<leader>gs", "vsplit | Lspsaga goto_definition", "n", opts) -- split and go to definition
	mapkey("<leader>gc", "Lspsaga code_action", "n", opts) -- see available code actions
	-- mapkey("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
	-- mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts) -- show diagnostics for line
	-- mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
	mapkey("<leader>gp", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
	mapkey("<leader>gn", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
	mapkey("<leader>gh", "Lspsaga hover_doc", "n", opts) -- documentation of under cursor
	mapkey("<leader>gm", "Markdwon Preview", "n", opts) -- markdown preview
	-- lsp specific keybinds
	if client.name == "pyright" then
		mapkey("<leader>oi", "PyrightOrganizeImports", "n", opts)
	end
end

return M
