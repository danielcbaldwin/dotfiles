return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- opts = { ensure_installed = { "terraform", "hcl" } },
    event = { "BufReadPre", "BufNewFile" },
    -- init = function()
    --   vim.treesitter.language.register("terraspace", "terraform")
    -- end,
    -- opts = {
    --   highlight = {
    --     disable = { "terraform", "hcl", "tf", "terraform-vars" },
    --   },
    -- },
  },
}
