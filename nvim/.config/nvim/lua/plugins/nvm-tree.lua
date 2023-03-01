-- ============== nvm-tree =================
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-web-devicons"
  },
  event = "VeryLazy",
  keys = {
    {'<Leader>n', ":NvimTreeToggle<cr>"},
  },
  cmd = "NvimTreeToggle",
  init = function()
    vim.api.nvim_create_autocmd({"VimEnter"}, {pattern = "*", callback = function()
      if 1 == #vim.v.argv then
        vim.cmd('NvimTreeToggle')
      end
    end})
  end,
  config = function()
    require("nvim-tree").setup({
      sort_by = function(nodes)
        table.sort(nodes, function(a, b)
          return string.lower(a.name) < string.lower(b.name)
        end)
      end,
      view = {
        width = 30,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },
      filters = {
        dotfiles = true,
      },
       renderer = {
         indent_markers = {
           enable = true,
         },
         icons = {
           modified_placement = "before",
           show = {
             modified = true
           },
           glyphs = {
             default = '',
             symlink = '',
             modified = '󰃉',        │                           ,
           },
         },
         group_empty = true,
       },
       modified = {
        enable = true,
        show_on_dirs = false,
       },
    })
  end,
}
-- ==========================================
