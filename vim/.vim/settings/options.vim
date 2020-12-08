"set mouse-=a
if has('mouse')
"  set mouse=a
endif

set t_Co=256
let base16colorspace=256
colorscheme Tomorrow-Night
"colorscheme wombat256grf
"colorscheme sonokai
"let g:sonokai_style = 'shusia'

" Enable clipboard integration
"set clipboard=unnamed

set nostartofline
set hidden

set number

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase             " ignore case when searching
set smartcase

set autoread                " Update open files when changed externally
set laststatus=2

set termencoding=utf-8
set encoding=utf-8
set showmode
set noshowcmd

set ttyfast

" ================ Scrolling ========================

set scrolloff=3         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=3

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

set matchpairs+=<:>
set vb t_vb= " Turn off the bell, this could be more annoying, but I'm not sure how

" More sane colors of matching brackets and parens
" highlight MatchParen cterm=bold ctermbg=bg ctermfg=Red

set list
set listchars=tab:>.,trail:.,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.
set foldmethod=indent       " automatically fold by indent level
set foldlevelstart=9999
