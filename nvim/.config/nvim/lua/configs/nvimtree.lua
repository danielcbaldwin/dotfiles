local options = {
  view = {
    width = 35
  },
  filters = {
    dotfiles = false,
    custom = { "^\\.git$" },
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
}

return vim.tbl_deep_extend("force", require "nvchad.configs.nvimtree", options)
