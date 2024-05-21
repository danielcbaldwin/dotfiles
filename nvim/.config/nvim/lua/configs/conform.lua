local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    yaml = { { "prettierd", "prettier" } },
    ruby = { { "prettierd", "prettier" } },
    go = { "goimports", "gofmt" },
    terraform = { "tflint" },
  },
  -- Set up format-on-save
  format_on_save = { async = false, timeout_ms = 500, lsp_fallback = true },
  -- Customize formatters
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
}

require("conform").setup(options)
