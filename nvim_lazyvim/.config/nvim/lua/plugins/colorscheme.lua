return {
  { "ellisonleao/gruvbox.nvim", enabled = false },

  { "folke/tokyonight.nvim", enabled = false },

  {
    "loctvl842/monokai-pro.nvim",
    enabled = true,
    opts = {
      filter = "spectrum",
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight-night",
      colorscheme = "monokai-pro",
    },
  },
}
