-- vim.g.loaded_netrw = 1 -- Disable NetRW (Default Exlorer)
-- vim.g.loaded_netrwPlugin = 1

local api = require('nvim-tree.api')
vim.keymap.set("n" , "<leader>f" , api.tree.toggle)

require('nvim-tree').setup()
require('nvim-web-devicons').setup()
