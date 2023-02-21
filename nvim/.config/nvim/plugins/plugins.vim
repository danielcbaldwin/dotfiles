" Bootstrap vim-plug
" https://github.com/junegunn/vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Begin installation of all plugins
call plug#begin('~/.local/share/nvim/site/plugged')

let g:plug_url_format = 'git@github.com:%s.git'
let g:plug_threads = 4

" ================= Naviagtion ====================
Plug 'preservim/nerdtree'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'tacahiroy/ctrlp-funky'

Plug 'fisadev/vim-ctrlp-cmdpalette'

Plug 'Lokaltog/vim-easymotion'

"Plug 'majutsushi/tagbar'
" =================================================

" ==================== Color ======================
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'crusoexia/vim-monokai'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'fatih/molokai'
Plug 'antlypls/vim-colors-codeschool'
" =================================================

" ===================== UI ========================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" =================================================

" ================== Commands =====================
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
" =================================================

" ============= Language Additions ================
Plug 'scrooloose/syntastic'

" Go
Plug 'fatih/vim-go'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/ruby-matchit'
Plug 'vim-scripts/taglist.vim'

" CSS
" Plug 'groenewege/vim-less'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'leshill/vim-json'

" HTML
Plug 'othree/html5.vim'

" Other Languages
Plug 'mutewinter/nginx.vim'
Plug 'hashivim/vim-terraform'
Plug 'JamshedVesuna/vim-markdown-preview'
" =================================================
call plug#end()

