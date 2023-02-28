return {
  {
    "sheerun/vim-polyglot",
    event = "VeryLazy",
  },
  {
    "hashivim/vim-terraform",
    event = "VeryLazy",
    ft = {"terraform", "hcl"},
  },
  {
    "tpope/vim-endwise",
    event = "VeryLazy",
    config = function()
      vim.g.ruby_operators = 1
    end,
  },
  {
    "vim-scripts/ruby-matchit",
    event = "VeryLazy",
  },
  {
    "mutewinter/nginx.vim",
    event = "VeryLazy",
  },
}
