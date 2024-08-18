-- 	Maximum number of items to show in the popup menu
vim.opt.pumheight = 20

-- Left Column
vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.o.signcolumn = "yes:2"

-- Indent
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
-- vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- Persistance
vim.o.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

-- Fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.o.foldlevelstart = 99
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 4
vim.opt.foldtext = ""

-- View Window
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8

-- Annoyance Fixes
vim.o.timeout = false
vim.opt.splitright = true
vim.opt.clipboard = "unnamed"

vim.g.python3_host_prog = "/Users/onurcan/.pyenv/shims/python"
vim.g.python2_host_prog = "/Users/onurcan/.pyenv/shims/python"
