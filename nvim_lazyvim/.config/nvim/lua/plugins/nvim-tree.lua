return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    keys = {
      { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },
    },
    init = function()
      local create_autocmd = vim.api.nvim_create_autocmd

      create_autocmd({ "VimEnter" }, {
        pattern = "*",
        callback = function(data)
          -- buffer is a directory
          local directory = vim.fn.isdirectory(data.file) == 1

          local args = {}
          for _, v in pairs(vim.v.argv) do
            if string.sub(v, 1, 2) ~= "--" then
              table.insert(args, v)
            end
          end

          if not directory then
            if 1 == #args then
              vim.cmd("NvimTreeToggle")
            end
            return
          end

          -- create a new, empty buffer
          vim.cmd.enew()

          -- wipe the directory buffer
          vim.cmd.bw(data.buf)

          -- change to the directory
          vim.cmd.cd(data.file)

          vim.cmd("NvimTreeToggle")
        end,
      })
    end,
    opts = {
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
    },
  },
}
