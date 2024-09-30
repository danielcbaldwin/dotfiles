-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.mapleader = ","

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local create_user_command = vim.api.nvim_create_user_command
local cmd = vim.cmd

create_user_command("Wget", function(opts)
  local url = opts.args
  if url ~= "" then
    vim.cmd(":exec 'r!wget -q -O- " .. url .. "'")
  else
    vim.cmd(":echo 'URL is required'")
  end
end, {
  nargs = "?",
})

create_user_command("CopyMode", function()
  vim.cmd(":set nonumber")
  vim.cmd(":NvimTreeClose")
end, {})

create_user_command("NoCopyMode", function()
  vim.cmd(":set number")
  vim.cmd(":NvimTreeOpen")
end, {})

cmd(":command WQ wq")
cmd(":command Wq wq")
cmd(":command W w")
cmd(":command Q q")

vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.clipboard = ""

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.autoindent = true
