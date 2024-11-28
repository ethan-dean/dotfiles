local mapkey = require("util.func-keymap").mapvimkey

-- Step between k/j and <C-U>/<C-D> for motions
vim.api.nvim_set_keymap("n", "J", "5j", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "K", "5k", {noremap = true, silent = true})

-- Buffer Navigation
mapkey("<leader>b", "e #", "n") -- Switch to Other Buffer

-- Directory Navigation
mapkey("<leader>m", "Neotree", "n")
mapkey("<leader>e", "Neotree toggle", "n")

-- Pane and Window Navigation (C-w converted to ^w by mapkey need vim)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true, silent=true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true, silent=true})

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally
mapkey("<leader>si", "vertical resize +5")
mapkey("<leader>sd", "vertical resize -5")
mapkey("<C-Up>", "resize +2", "n")
mapkey("<C-Down>", "resize -2", "n")

-- Commenting
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = true }) -- Comment block in visual mode
vim.api.nvim_set_keymap("v", "<C-/>", "gcb", { noremap = false }) -- Comment block in visual mode

-- Exiting without command line
mapkey("<leader>wb", "w", "n")
mapkey("<leader>wa", "wa", "n")
mapkey("<leader>wq", "wqa", "n")

-- Markdown Preview
mapkey("<leader>gm", "Markview splitToggle", "n")

-- Git Diffview
mapkey("<leader>do", "DiffviewOpen", "n")
mapkey("<leader>dh", "DiffviewOpen origin/main...HEAD", "n")
mapkey("<leader>dc", "DiffviewClose", "n")

-- Procrastination
mapkey("<leader>fml", "CellularAutomaton make_it_rain", "n")

-- Unbinds
-- History (tags related)?
vim.api.nvim_set_keymap('!', '<C-H>', '<Nop>', { noremap = true, silent = true })
