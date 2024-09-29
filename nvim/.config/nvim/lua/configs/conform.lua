local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { { "prettierd" } },
    html = { { "prettierd" } },
    yaml = { { "prettierd" } },
    ruby = { { "prettierd" } },
    go = { "goimports", "gofumpt" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
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
