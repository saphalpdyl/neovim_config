return {
  "VonHeikemen/lsp-zero.nvim",
  event = "InsertEnter",
  dependencies = {
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Required
    {'williamboman/mason-lspconfig.nvim'}, -- Required
  
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
  },
  config = function()
    local lsp = require("lsp-zero").preset({
      name = "minimal",
      set_lsp_keymaps = true,
      manage_nvim_cmp = true,
      suggest_lsp_servers = false,
    })

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ["<C-p>"] =  cmp.mapping.select_prev_item(cmp_select),
      ["<C-n>"] =  cmp.mapping.select_next_item(cmp_select),
      ["<C-Space>"] = cmp.mapping.complete() 
    })

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] =  cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] =  cmp.mapping.select_next_item(cmp_select),
        ["<C-Space>"] = cmp.mapping.complete() 
      })
    })

    require("mason-lspconfig").setup {
      handlers = {
        lsp.default_setup,
      }
    }

    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr,remap = false }

      vim.keymap.set("n","gd" , function() vim.lsp.buf.definition() end , opts)
      vim.keymap.set("n","K" , function() vim.lsp.buf.hover() end , opts)
      vim.keymap.set("i","<C-h>" , function() vim.lsp.buf.signature_help() end , opts)
    end
  end
}
