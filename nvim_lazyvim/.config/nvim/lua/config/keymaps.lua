-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Reselect visual block after indent/outdent
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })

-- Make Y behave like other capitals
map("n", "Y", "y$")

-- So we can use the arrow keys but still act like regular vim
map("i", "<up>", "<nop>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")
map("n", "<up>", "gk")
map("n", "<down>", "gj")
map("n", "<left>", "h")
map("n", "<right>", "l")
map("v", "<up>", "gk")
map("v", "<down>", "gj")
map("v", "<left>", "h")
map("v", "<right>", "l")

-- Spelling
map("n", "<Leader>s", "<cmd>setlocal spell! spelllang=en_us<CR>")

-- Buffer mappings
map("n", "<C-l>", ":bn<CR>", { silent = true })
map("n", "<C-Right>", ":bn<CR>", { silent = true })
map("n", "<ESC>[5C", ":bn<CR>", { silent = true }) -- Because OS X Terminal tries to be EMACS

map("n", "<C-h>", ":bp<CR>", { silent = true })
map("n", "<C-Left>", ":bp<CR>", { silent = true })
map("n", "<ESC>[5D", ":bp<CR>", { silent = true }) -- Because OS X Terminal tries to be EMACS

map("n", "<leader>d", "<leader>bd<CR>", { silent = true })

map("", "<C-k>", ":cp<CR>", {})
map("", "<C-j>", ":cn<CR>", {})
