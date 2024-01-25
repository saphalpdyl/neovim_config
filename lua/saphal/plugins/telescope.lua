return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.4',
  opts = {
    defaults = {
      path_display = {"smart"}
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  keys = {
    {"<leader>pf", function() require("telescope.builtin").find_files() end, desc="Search for files"},
    {
      "<leader>ps",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") });
      end,
      desc="Grep String to search"
    }
  },
}
