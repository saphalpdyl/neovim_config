return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
    },

    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },

    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },

    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },

    yadm = {
      enable = false
    },
  },
  init = function()
    local gs = require("gitsigns")

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode,l,r,opts)
    end

    map('n','<leader>hs', gs.stage_hunk, { desc = "Stage current hunk" })
    map('n','<leader>hr', gs.reset_hunk, { desc = "Reset current hunk" })
    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage visually selected lines" })
    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset visually selected lines" })
    map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage entire buffer" })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo last hunk staging" })
    map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset entire buffer" })
    map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview current hunk changes" })
    map('n', '<leader>hb', function() gs.blame_line {full=true} end, { desc = "Show blame for current line" })
    map('n', '<leader>htb', gs.toggle_current_line_blame, { desc = "Toggle blame for current line" })
    map('n', '<leader>hd', gs.diffthis, { desc = "Diff current hunk" })
    map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff current hunk against its base" })
    map('n', '<leader>htd', gs.toggle_deleted, { desc = "Toggle visibility of deleted lines" })
    map('n', '<leader>hj', gs.next_hunk, {desc = "Go to next hunk" })
    map('n', '<leader>hk', gs.prev_hunk, {desc = "Go to previous hunk" })

  end
}
