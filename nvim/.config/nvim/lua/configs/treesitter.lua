local options = {
  auto_install = true,
  ensure_installed = {
    -- General
    "lua",
    "markdown",
    "json5",
    "toml",
    "vim",
    --
    -- Web
    "html",
    "css",
    "javascript",
    --
    -- Node
    "typescript",
    "tsx",
    --
    -- Ruby
    "ruby",
    --
    -- Go
    "go",
    "gomod",
    "gosum",
    "gowork",
    --
    -- DevOps
    "bash",
    "terraform",
    "hcl",
  },
}

return vim.tbl_deep_extend("force", require "nvchad.configs.treesitter", options)
