-- Reselect visual block after indent/outdent
-- http://www.vimbits.com/bits/20
-- vnoremap("<", "<gv")
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
-- vnoremap(">", ">gv")
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })

-- Make Y behave like other capitals
--nmap("Y", "y$")
vim.api.nvim_set_keymap("n", "Y", "y$", {})

-- So we can use the arrow keys but still act like regular vim
--imap("<up>", "<nop>")
vim.api.nvim_set_keymap("i", "<up>", "<nop>", {})
--imap("<down>", "<nop>")
vim.api.nvim_set_keymap("i", "<down>", "<nop>", {})
--imap("<left>", "<nop>")
vim.api.nvim_set_keymap("i", "<left>", "<nop>", {})
--imap("<right>", "<nop>")
vim.api.nvim_set_keymap("i", "<right>", "<nop>", {})
--nmap("<up>", "gk")
vim.api.nvim_set_keymap("n", "<up>", "gk", {})
--nmap("<down>", "gj")
vim.api.nvim_set_keymap("n", "<down>", "gj", {})
--nmap("<left>", "h")
vim.api.nvim_set_keymap("n", "<left>", "h", {})
--nmap("<right>", "l")
vim.api.nvim_set_keymap("n", "<right>", "l", {})
--vmap("<up>", "gk")
vim.api.nvim_set_keymap("v", "<up>", "gk", {})
--vmap("<down>", "gj")
vim.api.nvim_set_keymap("v", "<down>", "gj", {})
--vmap("<left>", "h")
vim.api.nvim_set_keymap("v", "<left>", "h", {})
--vmap("<right>", "l")
vim.api.nvim_set_keymap("v", "<right>", "l", {})

-- Spelling
--nmap("<leader>s", ":setlocal spell! spelllang=en_us<CR>")
vim.api.nvim_set_keymap("n", "<Leader>s", "<cmd>setlocal spell! spelllang=en_us<CR>", {})
