-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "*.tf,*.tfvars",
--   command = "setfiletype tf",
-- })
--
-- create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "*.as,*.json,*.js",
--   command = "setfiletype javascript",
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go",
--   command = "setlocal ts=2 sw=2 sts=0 noexpandtab autoindent nolist",
-- })
