return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    run = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "ruby", "hcl", "go", "vim" },
        auto_install = true,
        --highlight = {
        --  enable = true,
        --  custom_captures = {
        --    ["include"] = "Keyword",
        --  },
        --},
      }
    end,
  },
}
