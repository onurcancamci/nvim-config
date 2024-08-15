vim.g.mapleader = " "

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

require("lazy-init")
require("style")
require("keymaps")
require("lsp-config")
-- require("neotree-config")
require("snippets")
require("util-config")

vim.opt.pumheight = 20

vim.opt.nu = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true

vim.opt.incsearch = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- vim.o.signcolumn = "yes:2"
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.wrap = false

vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
vim.cmd("highlight ColorColumn ctermbg=0 guibg=#282a3c")

vim.g.highlightedyank_highlight_duration = 100

vim.o.timeout = false

vim.opt.splitright = true

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

-- local function start_up_func()
-- 	vim.cmd("Neotree")
-- end
--
-- local function delayed_start_up_func()
-- 	local timer = vim.loop.new_timer()
-- 	-- Delay 2000ms and 0 means "do not repeat"
-- 	timer:start(500, 0, vim.schedule_wrap(start_up_func))
-- end
--
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	group = vim.api.nvim_create_augroup("neotree_show", {}),
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.schedule(delayed_start_up_func)
-- 	end,
-- })
--
-- vim.cmd("Neotree show")
