return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["cc"] = "@comment.outer"
          }
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next = {
            [']f'] = "@function.outer",
            [']c'] = "@class.outer",
          },
          goto_previous = {
            ['[f'] = "@function.outer",
            ['[c'] = "@class.outer",
          }
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = "@parameter.inner",
          },
          swap_previous = {
            ['<leader>A'] = "@parameter.inner",
          }
        }
      }
    })
  end
}
