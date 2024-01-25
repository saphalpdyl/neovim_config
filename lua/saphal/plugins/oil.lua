return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("oil").setup()
  end,
  keys = {
    {"-", ":Oil<CR>", desc="Open parent directory using Oil", silent=true}
  }
}
