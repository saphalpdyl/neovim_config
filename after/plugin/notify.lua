require('notify').setup{
  render = 'wrapped-compact',
  max_width = 50,
  timeout = 2000
}

vim.notify = require('notify')

vim.keymap.set('n', '<leader>un', function() 
  require('notify').dismiss({
    silent = true,
    pending = true,
  })
  end,
  {
    desc = "Dismiss all notifications"
  }
)
