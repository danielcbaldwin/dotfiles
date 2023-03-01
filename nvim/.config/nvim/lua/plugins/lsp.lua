return {
  --{
  --  "VonHeikemen/lsp-zero.nvim",
  --  branch = 'v1.x',
  --  dependencies = {
  --    -- LSP Support
  --    {'neovim/nvim-lspconfig'},             -- Required
  --    {'williamboman/mason.nvim'},           -- Optional
  --    {'williamboman/mason-lspconfig.nvim'},
  --
  --    -- Autocompletion
  --    {'hrsh7th/nvim-cmp'},         -- Required
  --    {'hrsh7th/cmp-nvim-lsp'},     -- Required
  --    {'hrsh7th/cmp-buffer'},       -- Optional
  --    {'hrsh7th/cmp-path'},         -- Optional
  --    {'saadparwaiz1/cmp_luasnip'}, -- Optional
  --    {'hrsh7th/cmp-nvim-lua'},     -- Optional
  --
  --    -- Snippets
  --    {'L3MON4D3/LuaSnip'},             -- Required
  --    {'rafamadriz/friendly-snippets'}, -- Optional
  --  },
  --  config = function()
  --    local lsp = require('lsp-zero').preset({
  --      name = 'minimal',
  --      set_lsp_keymaps = true,
  --      manage_nvim_cmp = true,
  --      suggest_lsp_servers = false,
  --    })
  --
  --    lsp.nvim_workspace() -- (Optional) Configure lua language server for neovim
  --    lsp.setup()
  --
  --    require("mason-lspconfig").setup {
  --        ensure_installed = {
  --          "lua_ls", -- Lua
  --          "terraformls", "tflint", -- Terraform
  --          "ruby_ls", -- Ruby
  --          "html", -- HTML
  --          "golangci_lint_ls", -- Go
  --          "bashls", -- Bash
  --        },
  --    }
  --  end,
  --},
}
