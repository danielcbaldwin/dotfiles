au! BufRead,BufNewFile *.as     setfiletype javascript
au! BufRead,BufNewFile *.as,*.json     setfiletype javascript
au! BufRead,BufNewFile *.ctp,*.thtml     setfiletype php
au! BufRead,BufNewFile *.jhtml     setfiletype html
au! BufRead,BufNewFile *.ejs     setfiletype html
au! BufRead,BufNewFile *.go setfiletype go
au! BufNewFile,BufRead *.rss setfiletype xml

function! StripTrailingWhite()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunction

autocmd BufWritePre * call StripTrailingWhite()

autocmd FileType go setlocal ts=2 sw=2 sts=0 noexpandtab autoindent nolist

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
