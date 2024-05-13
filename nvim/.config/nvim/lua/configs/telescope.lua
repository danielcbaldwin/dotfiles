local options = {
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

return vim.tbl_deep_extend("force", require "nvchad.configs.telescope", options)
