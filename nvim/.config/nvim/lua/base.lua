-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Map leader
vim.g.mapleader = ','

vim.opt.mouse = "a"

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.cmd([[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
]])

vim.opt.startofline = false
vim.opt.hidden = true

vim.opt.number = true

vim.opt.incsearch = true   --find the next match as we type the search
vim.opt.hlsearch = true    --hilight searches by default
vim.opt.ignorecase = true             -- ignore case when searching
vim.opt.smartcase = true

vim.opt.autoread = true                -- Update open files when changed externally
vim.opt.laststatus = 2

vim.opt.termencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.showmode = true
vim.opt.showcmd = false

vim.opt.ttyfast = true

-- ================ Scrolling ========================

vim.opt.scrolloff = 3         --Start scrolling when we're 8 lines away from margins
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 3

-- ===================================================

-- ================ Indentation ======================

vim.opt.autoindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.opt.wrap = true

-- ===================================================

-- Make Vim able to edit crontab files again.
vim.opt.backupskip="/tmp/*,/private/tmp/*"

vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.vb = false -- Turn off the bell, this could be more annoying, but I'm not sure how

-- More sane colors of matching brackets and parens
-- highlight MatchParen cterm=bold ctermbg=bg ctermfg=Red

vim.opt.list = true
vim.opt.listchars = "tab:>.,trail:.,nbsp:."
--autocmd filetype html,xml set listchars-=tab:>.
vim.opt.foldmethod = "indent"       -- automatically fold by indent level
vim.opt.foldlevelstart=9999

vim.cmd(":command WQ wq")
vim.cmd(":command Wq wq")
vim.cmd(":command W w")
vim.cmd(":command Q q")
