return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup()
    require("which-key").register({
      ["<leader>"] = {
        h = {
          name = "GitSigns"
        }
      }
    })
  end
}
