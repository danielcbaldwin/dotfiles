-- ============== telescope =================
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-treesitter',
      'nvim-lua/plenary.nvim'
    },
    --event = "VeryLazy",
    cmd = "Telescope",
    keys = {
      {"<Leader>ff", "<cmd>Telescope find_files<cr>"},
      {"<C-p>", "<cmd>Telescope find_files<cr>"},
      {"<Leader>fg", "<cmd>Telescope live_grep<cr>"},
      {"<Leader>fb", "<cmd>Telescope buffers<cr>"},
      {"<C-b>", "<cmd>Telescope buffers<cr>"},
      --{"<C-b>", "<cmd>Telescope oldfiles cwd_only=true alternate=git_files<cr>"},
      {"<Leader>fh", "<cmd>Telescope help_tags<cr>"},
      {"<Leader>l", "<cmd>Telescope treesitter<cr>"},
      {"<C-l>", "<cmd>Telescope treesitter<cr>"},
    },
    config = function()
      require('telescope').setup{
        defaults = {
          file_ignore_patterns = { "vendor/cache", "node_modules" },
        },
        pickers = {
          buffers = {
            sort_mru = true,
            ignore_current_buffer = true,
          }
        },
      }
    end,
  },
}
-- ==========================================
