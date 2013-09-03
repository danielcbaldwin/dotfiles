let mapleader = ","
let maplocalleader = ";"

" Reselect visual block after indent/outdent
" http://www.vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>ft Vatzf

" Toggle search highlights
" http://www.vimbits.com/bits/21
noremap <silent><Leader><space> :nohls<CR>

nnoremap <Leader>v :set invpaste paste?<CR>
set pastetoggle=<Leader>v

" Disable paste mode when leaving Insert Mode
" http://www.vimbits.com/bits/170
au InsertLeave * set nopaste

" Insert blank lines without going into insert mode
" http://www.vimbits.com/bits/176
nmap t o<ESC>k
nmap T O<ESC>j

" Make Y behave like other capitals
nmap Y y$

" Fix for TMUX
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
map <Esc>[B <Down>

" So we can use the arrow keys but still act like regular vim
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
nmap <up> gk
nmap <down> gj
nmap <left> h
nmap <right> l
vmap <up> gk
vmap <down> gj
vmap <left> h
vmap <right> l

" Spelling
nmap <leader>s :setlocal spell! spelllang=en_us<CR>

" Set list Chars - for showing characters that are not
" normally displayed i.e. whitespace, tabs, EOL
nmap <silent><leader>ll :set list!<CR>
set listchars=tab:▸\ ,eol:¬
set list

" Tagbar key binding
nnoremap <leader>l :TagbarToggle<CR>

" NerdTree key binding
noremap <leader>n :NERDTreeToggle<CR>
inoremap <leader>n <esc>:NERDTreeToggle<CR>

" ctrl+p Key Bindings
map <C-b> :CtrlPBuffer<CR>
