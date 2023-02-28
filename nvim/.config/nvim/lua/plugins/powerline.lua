-- ============== Powerline =================
return {
  "vim-airline/vim-airline",
  lazy = false,
  priority = 1000,
  dependencies = {
    "vim-airline/vim-airline-themes"
  },
  config = function()
    --vim.g.airline_theme = 'powerlineish'
    vim.g.airline_theme = 'sonokai'
    vim.g.airline_powerline_fonts = 1
    vim.g["airline#extenstions#branch#enabled"] = 1
    -- vim.g["airline#extenstions#syntastic#enabled"] = 1
    vim.g["airline#extenstions#ale#enabled"] = 1
    vim.g["airline#extenstions#whitespace#enabled"] = 0
  end,
}
-- ==========================================
--

