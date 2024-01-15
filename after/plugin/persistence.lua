require('persistence').setup {
  options = vim.opt.sessionoptions:get()
}

vim.keymap.set('n', '<leader>qs', function() require('persistence').load() end, { desc = 'Restore session' })
vim.keymap.set('n', '<leader>ql', function() require('persistence').load({ last = true }) end, { desc = 'Restore Last Session' })
vim.keymap.set('n', '<leader>qd', function() require("persistence").stop() end, { desc = 'Don\'t save current session' })
