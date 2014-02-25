let mapleader = ","

" Reselect visual block after indent/outdent
" http://www.vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" select all
nnoremap <Leader>a ggVG

" open a split window and change selection to it
nnoremap <leader>w <C-w>v<C-w>l

" Toggle search highlights
" http://www.vimbits.com/bits/21
nnoremap <silent><Leader><space> :nohls<CR>

nnoremap <Leader>pp :set invpaste paste?<CR>
set pastetoggle=<Leader>pp

" Disable paste mode when leaving Insert Mode
" http://www.vimbits.com/bits/170
au InsertLeave * set nopaste

" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" Insert blank lines without going into insert mode
" http://www.vimbits.com/bits/176
" nmap t o<ESC>k
" nmap T O<ESC>j

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

" Tagbar key binding
nnoremap <leader>l :TagbarToggle<CR>

" NerdTree key binding
nnoremap <leader>n :NERDTreeToggle<CR>

" ctrl+p Key Bindings
nmap <C-b> :CtrlPBuffer<CR>
nnoremap <C-l> :CtrlPFunky<CR>
" narrow the list down with a word under cursor
nnoremap <C-l>n :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Easymotion
nmap s <Plug>(easymotion-s)
nmap S <Plug>(easymotion-s2)
map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)
nmap <Leader>J <Plug>(easymotion-eol-j)
nmap <Leader>K <Plug>(easymotion-eol-k)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
nmap t <Plug>(easymotion-t)
nmap T <Plug>(easymotion-t2)
omap t <Plug>(easymotion-bd-tl)

" Other save options incase, because i always mess up
:command WQ wq
:command Wq wq
:command W w
:command Q q

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
