return {
  { "ellisonleao/gruvbox.nvim", enabled = false },
  { "folke/tokyonight.nvim", enabled = true },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
