let mapleader = ","
let maplocalleader = ";"

" Reselect visual block after indent/outdent
" http://www.vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" Toggle search highlights
" http://vimbits.com/bits/52
noremap <space> :set hlsearch! hlsearch?<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Disable paste mode when leaving Insert Mode
" http://www.vimbits.com/bits/170
au InsertLeave * set nopaste

" Insert blank lines without going into insert mode
" http://www.vimbits.com/bits/176
nmap t o<ESC>k
nmap T O<ESC>j

" Make Y behave like other capitals
nmap Y y$

" HTML Tidy, http://tidy.sourceforge.net/
" select xml text to format and hit ,x
vmap ,x :!tidy -q -i -xml<CR>

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

" Because it is easier, i guess
" imap jj <Esc>
" imap <up><up> <Esc>

" Spelling
nmap <leader>s :setlocal spell! spelllang=en_us<CR>

" Set list Chars - for showing characters that are not
" normally displayed i.e. whitespace, tabs, EOL
nmap <silent><leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Relative Line Number Toggle
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nmap <leader>r :call NumberToggle()<CR>

" Tagbar key binding
nnoremap <leader>l :TagbarToggle<CR>

" NerdTree key binding
noremap <leader>n :NERDTreeToggle<CR>
inoremap <leader>n <esc>:NERDTreeToggle<CR>

