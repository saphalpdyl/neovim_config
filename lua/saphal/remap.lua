vim.g.mapleader = " "  -- Setting the leader to Space

vim.keymap.set("i" , "jk" , "<Esc>")

vim.keymap.set("n" , "<C-j>" , "5j", { noremap = true }) -- For normal mode
vim.keymap.set("n" , "<C-k>" , "5k", { noremap = true })
vim.keymap.set("v" , "<C-j>" , "5j") -- For visual mode
vim.keymap.set("v" , "<C-k>" , "5k")

vim.keymap.set("n" , "<leader>ge" , "<C-t>")

vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>4>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Left>", "<C-w>4<", { noremap = true })
