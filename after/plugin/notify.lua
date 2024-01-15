require('notify').setup{
  render = 'wrapped-compact',
  max_width = 50,
  timeout = 2000
}

vim.notify = require('notify')
