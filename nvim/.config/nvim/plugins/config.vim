" ================ NerdTree ================
let NERDTreeShowBookmarks=1
let NERDTreeSortOrder=[]
augroup ps_nerdtree
  au!

  au Filetype nerdtree setlocal nolist
  au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END

let NERDTreeHighlightCursorline = 1
"let NERDTreeIgnore = ['\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
              "\ 'xapian_index','.*\.o$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NerdTreeMouseMode = 2
" ==========================================

" ============== ctrlp =====================
let g:ctrlp_extensions = ['funky', 'cmdpalette']
" ==========================================

" ============ vim-easymotion ==============
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
" ==========================================

" ================ tagbar ==================
"let g:tagbar_compact = 1
"let g:tagbar_sort = 0
"let g:tagbar_autofocus = 1
" ==========================================

" ============== Powerline =================
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extenstions#branch#enabled = 1
let g:airline#extenstions#syntastic#enabled = 1
let g:airline#extenstions#whitespace#enabled = 0
" ==========================================

" ============ vim-commentary ==============
autocmd FileType ruby set commentstring=#\ %s
autocmd FileType vim set commentstring=\"\ %s
autocmd FileType javascript set commentstring=\/\/\ %s
" ==========================================

" ========= scrooloose/syntastic ===========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_go_go_build_args = "-o /dev/null"
let g:syntastic_go_checkers=['go']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_sh_checkers = ['sh', 'shfmt']
" ==========================================

" ============= fatih/vim-go ===============
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
" ==========================================

" ========== vim-ruby/vim-ruby =============
let ruby_operators=1
" ==========================================
