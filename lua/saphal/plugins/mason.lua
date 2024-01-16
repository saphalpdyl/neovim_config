return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  
  config = function()
    require("mason").setup()
  end
}
