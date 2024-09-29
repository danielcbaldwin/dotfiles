return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<Leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<C-p>", "<cmd>Telescope find_files<cr>" },
      { "<Leader>fg", "<cmd>Telescope live_grep<cr>" },
      { "<Leader>fb", "<cmd>Telescope buffers<cr>" },
      { "<C-b>", "<cmd>Telescope buffers<cr>" },
      --{"<C-b>", "<cmd>Telescope oldfiles cwd_only=true alternate=git_files<cr>"},
      { "<Leader>fh", "<cmd>Telescope help_tags<cr>" },
      { "<Leader>l", "<cmd>Telescope treesitter<cr>" },
      { "<C-l>", "<cmd>Telescope treesitter<cr>" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "vendor/cache", "node_modules" },
      },
      pickers = {
        buffers = {
          sort_mru = true,
          ignore_current_buffer = true,
        },
      },
    },
  },
}
