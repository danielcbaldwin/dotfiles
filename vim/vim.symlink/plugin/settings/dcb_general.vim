set matchpairs+=<:>
set vb t_vb= " Turn off the bell, this could be more annoying, but I'm not sure how

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

" More sane colors of matching brackets and parens
highlight MatchParen cterm=bold ctermbg=bg ctermfg=Red
