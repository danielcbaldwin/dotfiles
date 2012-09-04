"set mouse-=a
if has('mouse')
"  set mouse=a
endif

set t_Co=256
colorscheme Tomorrow-Night

" Enable clipboard integration
"set clipboard=unnamed

set nostartofline

set history=1000            " Store a ton of history

set number

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase             " ignore case when searching

set autoread                " Update open files when changed externally
set laststatus=2

set encoding=utf-8
set showmode
set noshowcmd

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ===================================================

" ================ Indentation ======================

set autoindent
set backspace=2
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set wrap

" ===================================================

"set showmatch              " brackets/braces that is
"set mat=3                  " duration to show matching brace (1/10 sec)

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight TODO
match Todo /<+.\++>/

set matchpairs+=<:>
set vb t_vb= " Turn off the bell, this could be more annoying, but I'm not sure how

" More sane colors of matching brackets and parens
" highlight MatchParen cterm=bold ctermbg=bg ctermfg=Red
