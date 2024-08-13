vim.g.mapleader = " "

require("lazy-init")
require("style")
require("keymaps")

vim.opt.ignorecase = true
vim.opt.hlsearch = true

vim.g.highlightedyank_highlight_duration = 100

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank {higroup = 'IncSearch', timeout = 100}
    end
})
