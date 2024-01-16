return {
  {
    "nvim-lualine/lualine.nvim", -- Status Bar
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    --event = { "LazyFile", "VeryLazy" },
    
    opts = {
      ensure_installed = { "c", "lua", "vim", "query" , "typescript" , "javascript", "json", "python", "sql", "bash" },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    }
  }
}
