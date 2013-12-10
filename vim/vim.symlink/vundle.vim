set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" ================= Naviagtion ====================
Bundle 'scrooloose/nerdtree'
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

" Bundle 'fholgado/minibufexpl.vim'
  " let g:miniBufExplMapWindowNavVim = 1
  " let g:miniBufExplMapWindowNavArrows = 1

Bundle 'kien/ctrlp.vim'

Bundle 'majutsushi/tagbar'
  let g:tagbar_compact = 1
  let g:tagbar_sort = 0
  let g:tagbar_autofocus = 1
" =================================================

" ================== Debugging ====================
" Bundle 'scrooloose/syntastic'
" =================================================
" ==================== Color ======================
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'vim-scripts/molokai'
" Bundle 'danielcbaldwin/Color-Sampler-Pack'
" Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
" =================================================

" ===================== UI ========================
Bundle 'Lokaltog/vim-powerline'
  let g:Powerline_cache_enabled = 1
  let g:Powerline_symbols = 'fancy'
" =================================================

" ================== Commands =====================
Bundle 'tpope/vim-fugitive'

Bundle 'tpope/vim-surround'

Bundle 'tpope/vim-commentary'
  autocmd FileType ruby set commentstring=#\ %s
  autocmd FileType vim set commentstring=\"\ %s
  autocmd FileType javascript set commentstring=\/\/\ %s
" =================================================

" ================== Helpers ======================
" Bundle 'ervandew/supertab'
" Bundle 'airblade/vim-gitgutter'
"  Bundle 'rstacruz/sparkup'
" =================================================

" ============= Language Additions ================
" Ruby
Bundle 'vim-ruby/vim-ruby'
  let ruby_operators=1

Bundle 'tpope/vim-endwise'

Bundle 'vim-scripts/ruby-matchit'

" Javascript
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
" Other Languages
Bundle 'msanders/cocoa.vim'
Bundle 'mutewinter/taskpaper.vim'
Bundle 'mutewinter/nginx.vim'
Bundle 'timcharper/textile.vim'
Bundle 'mutewinter/vim-css3-syntax'
Bundle 'acustodioo/vim-tmux'
Bundle 'hallison/vim-markdown'
Bundle 'groenewege/vim-less'
" Bundle 'othree/html5-syntax.vim'
Bundle 'othree/html5.vim'
" =================================================
"
" =================== Others ======================
Bundle 'davidoc/taskpaper.vim'
Bundle 'mbbill/VimExplorer'
" =================================================

filetype plugin indent on
