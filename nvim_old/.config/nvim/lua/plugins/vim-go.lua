-- ============= fatih/vim-go ===============
return {
  "fatih/vim-go",
  ft = "go",
  cmd = "GoImports",
  keys = {
    {"<C-i>", "<cmd>GoImports<cr>"},
  },
  config = function()
    vim.g.go_auto_type_info = 1
    vim.g.go_highlight_functions = 1
    vim.g.go_highlight_methods = 1
    vim.g.go_highlight_structs = 1
    vim.g.go_highlight_operators = 1
    vim.g.go_highlight_build_constraints = 1
    vim.g.go_fmt_fail_silently = 1
  end,
}
-- ==========================================

