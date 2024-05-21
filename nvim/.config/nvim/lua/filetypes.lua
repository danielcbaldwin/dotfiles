vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  command = "setlocal ts=2 sw=2 sts=0 noexpandtab autoindent nolist",
})
