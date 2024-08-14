local hmark = require("harpoon.mark")
local hui = require("harpoon.ui")

vim.keymap.set("n", "S", "s", { noremap = true })

vim.keymap.set("n", "s", ":w<CR>", { noremap = false })

vim.keymap.set("n", "<leader><space>", ":noh<CR>", { noremap = true })

vim.keymap.set("n", "<leader>s", "ysiw", { noremap = false })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-f>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set("x", "<leader>p", '"_dP', { noremap = false })

-- Shift Option O => make a new line up
vim.keymap.set("n", "Ø", "O<Esc>j", { noremap = false })
vim.keymap.set("n", "ø", "o<Esc>k", { noremap = false })

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", ";", builtin.find_files, {})
vim.keymap.set("n", "<leader>pe", vim.cmd.Ex, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})

vim.keymap.set("n", "<C-p>", builtin.git_files, {})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>a", hmark.add_file)
vim.keymap.set("n", "<leader>r", hmark.rm_file)
vim.keymap.set("n", "<leader>e", hui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function()
	hui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
	hui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
	hui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
	hui.nav_file(4)
end)
vim.keymap.set("n", "<leader>5", function()
	hui.nav_file(5)
end)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<M-left>", "<C-w>h")
vim.keymap.set("n", "<M-right>", "<C-w>l")
vim.keymap.set("n", "<M-up>", "<C-w>k")
vim.keymap.set("n", "<M-down>", "<C-w>j")

vim.keymap.set("n", "<leader>m", ":bn<CR>")
vim.keymap.set("n", "<leader>n", ":bp<CR>")
