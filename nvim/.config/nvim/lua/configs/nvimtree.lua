local options = {
  view = {
    width = 35,
  },
  filters = {
    dotfiles = false,
    custom = { "^\\.git$", "^\\.terraform$", "^\\.terraspace-cache$" },
  },
  git = {
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      modified_placement = "before",
      show = {
        modified = true,
        git = true,
      },
    },
  },
  modified = {
    enable = true,
    show_on_dirs = true,
  },
  sort = {
    sorter = "name",
    folders_first = false,
  },
}

return vim.tbl_deep_extend("force", require "nvchad.configs.nvimtree", options)
