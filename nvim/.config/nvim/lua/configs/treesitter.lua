local options = {
  auto_install = true,
  ensure_installed = {
    -- General
    "lua",
    "markdown",
    "json",
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
  },
}

return vim.tbl_deep_extend("force", require "nvchad.configs.treesitter", options)
