require "nvchad.options"

-- add yours here!

local o = vim.o

o.mouse = "a"
--o.mouse = "nicr"
o.termguicolors = true
o.startofline = false
o.hidden = true

o.number = true

o.incsearch = true   --find the next match as we type the search
o.hlsearch = true    --hilight searches by default
o.ignorecase = true             -- ignore case when searching
o.smartcase = true

o.autoread = true                -- Update open files when changed externally
o.laststatus = 2

o.termencoding = "utf-8"
o.encoding = "utf-8"
o.showmode = true
o.showcmd = false

o.ttyfast = true

-- ================ Undo ==========================
o.undodir = "/tmp/.vim-undo-dir"
o.undofile = true
o.swapfile = false
o.undolevels = 1000
o.undoreload = 10000
-- ===================================================

-- ================ Scrolling ========================
o.scrolloff = 8
o.sidescrolloff = 15
o.sidescroll = 3
-- ===================================================

-- ================ Indentation ======================
o.autoindent = true
o.backspace = "indent,eol,start"
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2
o.expandtab = true
o.wrap = true
-- ===================================================

o.backupskip="/tmp/*,/private/tmp/*"

o.matchpairs = "(:),{:},[:],<:>"
o.vb = false -- Turn off the bell

o.list = false
o.listchars = "tab:>.,trail:.,nbsp:."

o.foldmethod = "indent"       -- automatically fold by indent level
o.foldlevelstart=9999

-- o.cursorlineopt ='both' -- to enable cursorline!
