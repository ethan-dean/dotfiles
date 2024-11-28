-- Format on save
-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = lsp_fmt_group,
--   callback = function()
--     local efm = vim.lsp.get_active_clients({ name = "efm" })
--
--     if vim.tbl_isempty(efm) then
--       return
--     end
--     vim.lsp.buf.format({ name = "efm", async = true})
--   end,
-- })
-- Dashboard quicker startup
local dashboard_group = vim.api.nvim_create_augroup("dashboard_enter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  group = dashboard_group,
  callback = function ()
    vim.keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
  end
})

-- Open float diagnostics for errors 
local diagnostic_group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = diagnostic_group,
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})
