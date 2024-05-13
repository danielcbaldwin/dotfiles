-- Buffer mappings
vim.api.nvim_set_keymap('n', '<C-l>',':bn<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':bn<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<ESC>[5C', ':bn<CR>', { silent = true }) -- Because OS X Terminal tries to be EMACS

vim.api.nvim_set_keymap('n', '<C-h>', ':bp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':bp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<ESC>[5D', ':bp<CR>', { silent = true }) -- Because OS X Terminal tries to be EMACS

vim.api.nvim_set_keymap('n', '<leader>d', '<leader>bd<CR>', { silent = true })

vim.api.nvim_set_keymap('', '<C-k>', ':cp<CR>', {})
vim.api.nvim_set_keymap('', '<C-j>', ':cn<CR>', {})
