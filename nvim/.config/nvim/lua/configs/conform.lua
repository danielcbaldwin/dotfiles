local options = {
  lsp_fallback = true,
  formatters_by_ft = {
    lua = { "stylua" },
    ruby = { { "prettierd" } },
    go = { "goimports" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
  },
  -- Set up format-on-save
  format_on_save = { async = false, timeout_ms = 15000, lsp_fallback = true },
  -- default_format_opts = { async = false, quiet = false, timeout_ms = 3000, lsp_format = "fallback" },
  -- Customize formatters
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
    goimports = {
      command = "goimports",
      args = function()
        return { "-w", "$FILENAME" }
      end,
      stdin = false,
    },
  },
}

require("conform").setup(options)
