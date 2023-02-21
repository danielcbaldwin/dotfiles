" GUI Options
if has("gui_running")
	set guioptions=egmrt

  " Move a line of text using (on Mac)
  " http://vimbits.com/bits/283
  nmap <D-j> mz:m+<cr>`z
  nmap <D-k> mz:m-2<cr>`z
  vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
  vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z
endif

" Open NerdTree when vim (aka nvim) opens up
" unless a file is passed to it on the command line
function! NerdTreeStartUp()
  if 0 == argc()
    NERDTree
  endif
endfunction

autocmd VimEnter * call NerdTreeStartUp()
