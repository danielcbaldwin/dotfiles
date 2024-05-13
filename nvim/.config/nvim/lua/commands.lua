local create_user_command = vim.api.nvim_create_user_command
local cmd = vim.cmd

create_user_command("Wget", function(opts)
  local url = opts.args
  if url ~= "" then
    vim.cmd(":exec 'r!wget -q -O- " .. url .. "'")
  else
    vim.cmd(":echo 'URL is required'")
  end
end, {
  nargs = "?",
})

create_user_command("CopyMode", function()
  vim.cmd(":set nonumber")
  vim.cmd(":NvimTreeClose")
end, {})

create_user_command("NoCopyMode", function()
  vim.cmd(":set number")
  vim.cmd(":NvimTreeOpen")
end, {})

cmd(":command WQ wq")
cmd(":command Wq wq")
cmd(":command W w")
cmd(":command Q q")
