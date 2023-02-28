-- ============= nvim-lint ===============
return {
  "mfussenegger/nvim-lint",
  event = {"BufWritePost", "VeryLazy"},
  config = function()
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
-- ==========================================

