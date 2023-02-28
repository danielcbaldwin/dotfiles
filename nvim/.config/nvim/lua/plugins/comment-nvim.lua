-- ============ comment.nvim ==============
return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require('Comment').setup({
      padding = false,

    })
    local ft = require('Comment.ft')
    ft.ruby = '# %s'
    ft.vim = '" %s'
    ft.javascript = {'// %s', '/* %s */'}
  end,
}
-- ==========================================

