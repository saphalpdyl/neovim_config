return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({
          silent = true,
          pending = true,
        })
      end,
      desc = "Dismiss all notifications"
    },
  },
  opts = {
    render = "wrapped-compact",
    max_width = 50,
    timeout = 2000
  },
  init = function()
    vim.notify = require("notify")
  end
}
