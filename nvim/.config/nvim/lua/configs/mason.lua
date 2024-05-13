local options = {
  automatic_installation = true,
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "prettierd",
    "bash-language-server",
    "terraform-ls",
    "tflint",
    "gopls",
    "goimports",
    "snyk",
    "docker-compose-language-service",
  },
}

--return options
return vim.tbl_deep_extend("force", require "nvchad.configs.mason", options)
