vim.api.nvim_create_user_command("Wget", function(opts)
  local url = opts.args
  if url ~= "" then
    vim.cmd(":exec 'r!wget -q -O- " .. url .. "'")
  else
    vim.cmd(":echo 'URL is required'")
  end
end, {
  nargs = "?",
})

vim.api.nvim_create_user_command("CopyMode", function(opts)
  vim.cmd(":set nonumber")
  vim.cmd(":NvimTreeClose")
end, {})

vim.api.nvim_create_user_command("NoCopyMode", function(opts)
  vim.cmd(":set number")
  vim.cmd(":NvimTreeOpen")
end, {})
