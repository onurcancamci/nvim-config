vim.keymap.set("n", "S", "s", {noremap = true})

vim.keymap.set("n", "s", ":w<CR>", {noremap = false})

vim.keymap.set("n", "<leader><space>", ":noh<CR>", {noremap = true})

vim.keymap.set("n", "<leader>s", "ysiw", {noremap = false})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true})
vim.keymap.set("n", "<C-f>", "<C-u>zz", {noremap = true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {noremap = true})

vim.keymap.set("n", "<leader>p", "\"_dP", {noremap = false})

vim.keymap.set("n", "ø", "o<Esc>k", {noremap = false})

-- Shift Option O => make a new line up
vim.keymap.set("n", "Ø", "O<Esc>j", {noremap = false})

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
