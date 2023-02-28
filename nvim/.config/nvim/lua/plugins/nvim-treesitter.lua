return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    run = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function()
      --require('nvim-treesitter.configs').setup {
      --  ensure_installed = { "hcl", "go", "gomod", "lua", "vim", "help" },
      --  sync_install = false,
      --  auto_install = true,
      --  highlight = {
      --    enable = true,
      --  },
      --}
    end,
  },
}
