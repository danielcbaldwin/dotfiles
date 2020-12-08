let bundles_installed=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let bundles_installed=0
endif
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ================= Naviagtion ====================
Plugin 'preservim/nerdtree'
  let NERDTreeShowBookmarks=1
  let NERDTreeSortOrder=[]

  augroup ps_nerdtree
      au!

      au Filetype nerdtree setlocal nolist
      au Filetype nerdtree nnoremap <buffer> K :q<cr>
  augroup END

  let NERDTreeHighlightCursorline = 1
  let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                      \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                      \ '.*\.o$', 'db.db', 'tags.bak']

  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let g:NERDTreeMouseMode = 2

Plugin 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_extensions = ['funky', 'cmdpalette']

Plugin 'tacahiroy/ctrlp-funky'

" Plugin 'danielcbaldwin/ctrlp-modified.vim'
" Plugin 'endel/ctrlp-filetype.vim'
Plugin 'fisadev/vim-ctrlp-cmdpalette'

Plugin 'Lokaltog/vim-easymotion'
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1

Plugin 'majutsushi/tagbar'
  let g:tagbar_compact = 1
  let g:tagbar_sort = 0
  let g:tagbar_autofocus = 1
" =================================================

" ==================== Color ======================
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'gryf/wombat256grf'
Plugin 'sainnhe/sonokai'
" =================================================

" ===================== UI ========================
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme             = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
" =================================================

" ================== Commands =====================
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
  autocmd FileType ruby set commentstring=#\ %s
  autocmd FileType vim set commentstring=\"\ %s
  autocmd FileType javascript set commentstring=\/\/\ %s
" =================================================

" ============= Language Additions ================
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/syntastic'
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
  "let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
  "nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Go
Plugin 'fatih/vim-go'
  let g:go_auto_type_info = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_fail_silently = 1

" Ruby
  let ruby_operators=1
Plugin 'tpope/vim-endwise'
Plugin 'vim-scripts/ruby-matchit'

" Other Languages
Plugin 'mutewinter/nginx.vim'
Plugin 'hashivim/vim-terraform'

" =================================================
call vundle#end()
if bundles_installed == 0
  echo "Installing Plugins, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
filetype plugin indent on
