return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        padding = false,
      }
      local ft = require "Comment.ft"
      ft.ruby = "# %s"
      ft.vim = '" %s'
      ft.javascript = { "// %s", "/* %s */" }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle" },
    keys = {
      { "<Leader>n", ":NvimTreeToggle<cr>" },
    },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
  --
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<Leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<C-p>", "<cmd>Telescope find_files<cr>" },
      { "<Leader>fg", "<cmd>Telescope live_grep<cr>" },
      { "<Leader>fb", "<cmd>Telescope buffers<cr>" },
      { "<C-b>", "<cmd>Telescope buffers<cr>" },
      { "<Leader>fh", "<cmd>Telescope help_tags<cr>" },
      { "<Leader>l", "<cmd>Telescope treesitter<cr>" },
      { "<C-l>", "<cmd>Telescope treesitter<cr>" },
    },
    opts = function()
      return require "configs.telescope"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function()
      return require "configs.mason"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "configs.treesitter"
    end,
  },

  --{
  --  "hashivim/vim-terraform",
  --  ft = { "terraform" },
  --},
  --{
  --  "tpope/vim-endwise",
  --  ft = { "terraform", "ruby" },
  --  config = function()
  --    vim.g.ruby_operators = 1
  --  end,
  --},
  --{
  --  "vim-scripts/ruby-matchit",
  --  ft = { "terraform", "ruby" },
  --},
}
