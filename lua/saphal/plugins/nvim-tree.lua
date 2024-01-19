return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Recommendation from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup{
      view = {
        width = 30,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    }

    vim.keymap.set("n", "<leader>f", require("nvim-tree.api").tree.toggle)
  end
}
