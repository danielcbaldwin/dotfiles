-- Reselect visual block after indent/outdent
-- http://www.vimbits.com/bits/20
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Make Y behave like other capitals
nmap("Y", "y$")

-- So we can use the arrow keys but still act like regular vim
imap("<up>", "<nop>")
imap("<down>", "<nop>")
imap("<left>", "<nop>")
imap("<right>", "<nop>")
nmap("<up>", "gk")
nmap("<down>", "gj")
nmap("<left>", "h")
nmap("<right>", "l")
vmap("<up>", "gk")
vmap("<down>", "gj")
vmap("<left>", "h")
vmap("<right>", "l")

-- Spelling
nmap("<leader>s", ":setlocal spell! spelllang=en_us<CR>")

