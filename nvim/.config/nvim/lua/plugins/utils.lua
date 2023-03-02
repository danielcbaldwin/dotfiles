return {
  {
    "tpope/vim-fugitive",
    cmd = {"Git", "GitBlame", },
  },
  {
    "dense-analysis/ale",
    init = function()
      vim.g.ale_fix_on_save = 1
      vim.g.ale_lint_on_enter = 0
      vim.g.ale_lint_on_insert_leave = 0
      vim.g.ale_lint_on_filetype_changed = 0
      vim.g.ale_lint_on_text_changed = 'never'
      vim.g.ale_disable_lsp = 1
      vim.g.ale_fixers = {
        [ '*' ] = { "remove_trailing_lines", "trim_whitespace" },
        [ 'javascript' ] = 'prettier',
        [ 'css' ] = 'prettier',
      }
    end,
  }
}
