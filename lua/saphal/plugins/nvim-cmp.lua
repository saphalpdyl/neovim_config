return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {'neovim/nvim-lspconfig'},             -- Required

    -- Autocompletion
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'onsails/lspkind.nvim'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(_, vim_item)
            return vim_item
          end
        })
      },
      sources = {
        { name = 'nvim_lsp'},
        { name = 'path'},
        { name = 'buffer'},
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-p>"] =  cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] =  cmp.mapping.select_next_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({ select = false })
      }),
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      }
    })

    local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', {clear = true})

    vim.api.nvim_create_autocmd('LspAttach',{
      group = lsp_cmds,
      desc = 'LSP actions',
      callback = function()
        local bufmap = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = true })
        end

        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap('n', 'gb', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
        bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
      end
    })
  end
}
