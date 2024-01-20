return {
  "folke/trouble.nvim",
  opts = {
    use_diagnostic_signs = true,
    signs = {
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "",
    },
  },
  keys = {
    {"<leader>xx", function() require("trouble").toggle() end, desc="Toggle Trouble"},
    {"<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc="Toggle Workspace Diagnostics"},
    {"<leader>xd", function() require("trouble").toggle("document_diagnostics") end, desc="Toggle Document Diagnostics"},
    {"<leader>xq", function() require("trouble").toggle("quickfix") end, desc="Toggle Quickfix"},
    {"<leader>xl", function() require("trouble").toggle("loclist") end, desc="Toggle Location List"},
    {"gR", function() require("trouble").toggle("lsp_references") end, desc="Toggle LSP References"},
  }
}
