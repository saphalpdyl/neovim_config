-- vim.g.loaded_netrw = 1 -- Disable NetRW (Default Exlorer)
-- vim.g.loaded_netrwPlugin = 1

local api = require('nvim-tree.api')
vim.keymap.set("n" , "<leader>ef" , api.tree.toggle)

require('nvim-tree').setup{
  view = {
    width = 40
  }
}
require('nvim-web-devicons').setup()
