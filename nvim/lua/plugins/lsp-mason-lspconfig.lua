local opts = {
  ensure_installed = {
    "efm",
    "lua_ls",
    "emmet_ls",
    "vtsls",
    "html",
    "cssls",
    "tailwindcss",
    "jsonls",
    "bashls",
    "pyright",
  },
  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}
