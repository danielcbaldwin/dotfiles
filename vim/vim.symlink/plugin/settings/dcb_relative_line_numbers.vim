" Relative Line Number Toggle
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
map <C-n> :call NumberToggle()<CR>
map <leader>r :call NumberToggle()<CR>
