au! BufRead,BufNewFile *.as     setfiletype javascript
au! BufRead,BufNewFile *.as,*.json     setfiletype javascript
au! BufRead,BufNewFile *.ctp,*.thtml     setfiletype php
au! BufRead,BufNewFile *.jhtml     setfiletype html
au! BufRead,BufNewFile *.ejs     setfiletype html

function! StripTrailingWhite()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunction

autocmd BufWritePre  *.{rb,php}  call StripTrailingWhite()
