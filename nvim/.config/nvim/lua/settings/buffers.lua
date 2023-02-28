-- Buffer mappings
nmap('<silent><C-l>',':bn<CR>')
nmap('<silent><C-Right>', ':bn<CR>')
nmap('<silent><ESC>[5C', ':bn<CR>') -- Because OS X Terminal tries to be EMACS

nmap('<silent><C-h>', ':bp<CR>')
nmap('<silent><C-Left>', ':bp<CR>')
nmap('<silent><ESC>[5D', ':bp<CR>') -- Because OS X Terminal tries to be EMACS

nmap('<silent><leader>d', '<leader>bd<CR>')

map('<C-k>', ':cp<CR>')
map('<C-j>', ':cn<CR>')

