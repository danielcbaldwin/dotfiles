--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--if not vim.loop.fs_stat(lazypath) then
--  vim.fn.system({
--    "git",
--    "clone",
--    "--filter=blob:none",
--    "https://github.com/folke/lazy.nvim.git",
--    "--branch=stable", -- latest stable release
--    lazypath,
--  })
--end
--vim.opt.rtp:prepend(lazypath)
--
--require("lazy").setup(
return  {
  --{
  --  "chriskempson/vim-tomorrow-theme",
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --    -- vim.cmd([[colorscheme Tomorrow-Night]])
  --  end,
  --},
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.g.
      vim.g.sonokai_style = 'shusia'
      vim.g.sonokai_better_performance = 1
      vim.cmd([[colorscheme sonokai]])
    end,
  },
}
--)
