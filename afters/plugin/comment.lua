local cmnt = require('Comment')

cmnt.setup({
  -- No JSX / TSX support
  mappings = {
    basic = true,
  },
  -- toggler = {
  --   line = '<leader>cu',
  --   block = '<leader>cb'
  -- },
  opleader = {
    line = '<leader>c',
    block = '<leader>b',
  },
})
