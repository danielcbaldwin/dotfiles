require "nvchad.autocmds"

local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd({"VimEnter"}, {pattern = "*", callback = function(data)
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
