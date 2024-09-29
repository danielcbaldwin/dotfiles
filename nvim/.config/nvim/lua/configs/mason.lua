local options = {
  automatic_installation = true,
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "prettierd",
    "bash-language-server",
    "tflint",
    "goimports",
    "gofumpt",
    "gomodifytags",
    "impl",
    "delve",
    "snyk",
    "docker-compose-language-service",
  },
}

--return options
return vim.tbl_deep_extend("force", require "nvchad.configs.mason", options)
