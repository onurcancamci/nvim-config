vim.g.mapleader = " "

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

require("lazy-init")
require("colors")
require("keymaps")
require("lsp-config")
require("neotree-config")

vim.opt.nu = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.wrap = false

vim.g.highlightedyank_highlight_duration = 100

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

vim.cmd("Neotree")
