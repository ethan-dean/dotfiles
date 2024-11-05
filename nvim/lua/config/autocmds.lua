-- Format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = lsp_fmt_group,
  callback = function()
    local efm = vim.lsp.get_active_clients({ name = "efm" })

    if vim.tbl_isempty(efm) then
      return
    end
    vim.lsp.buf.format({ name = "efm", async = true})
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  group = vim.api.nvim_create_augroup("dashboard_enter", { clear = true }),
  callback = function ()
    vim.keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
  end
})
