return {
  {
    "sheerun/vim-polyglot",
    event = "VeryLazy",
  },
  {
    "hashivim/vim-terraform",
    ft = {"terraform", "hcl"},
  },
  {
    "tpope/vim-endwise",
    ft = {"terraform", "hcl", "ruby"},
    config = function()
      vim.g.ruby_operators = 1
    end,
  },
  {
    "vim-scripts/ruby-matchit",
    ft = {"terraform", "hcl", "ruby"},
  },
  {
    "mutewinter/nginx.vim",
    --event = "VeryLazy",
  },
}
