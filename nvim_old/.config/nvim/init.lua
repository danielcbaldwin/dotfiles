-- Base
require('base')

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins', {
  concurrency = 4,
  checker = {
    enabled = true,
    consurrency = 1,
    notify = false,
  },
  change_detection = {
    enabled = false,
  },
})

-- Settings
require('settings')
