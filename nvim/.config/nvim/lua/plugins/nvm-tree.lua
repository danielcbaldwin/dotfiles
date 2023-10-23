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
    vim.api.nvim_create_autocmd({"VimEnter"}, {pattern = "*", callback = function(data)
      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1

      local args = {}
      for _,v in pairs(vim.v.argv) do
        if string.sub(v,1,2) ~= "--" then
          table.insert(args, v)
        end
      end

      if not directory then
        if 1 == #args then
          vim.cmd('NvimTreeToggle')
        end
        return
      end

      -- create a new, empty buffer
      vim.cmd.enew()

      -- wipe the directory buffer
      vim.cmd.bw(data.buf)

      -- change to the directory
      vim.cmd.cd(data.file)


      vim.cmd('NvimTreeToggle')
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
        width = 30
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
