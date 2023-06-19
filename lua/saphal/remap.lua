vim.g.mapleader = " " 
vim.keymap.set("n" , "<leader>pv" , vim.cmd.Ex)

vim.keymap.set("i" , "jk" , "<Esc>")

vim.keymap.set("n" , "<C-j>" , "5j") -- For normal mode
vim.keymap.set("n" , "<C-k>" , "5k")
vim.keymap.set("v" , "<C-j>" , "5j") -- For visual mode
vim.keymap.set("v" , "<C-k>" , "5k")

vim.keymap.set("n" , "<leader>ge" , "<C-t>");
