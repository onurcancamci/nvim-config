-- if pressed leader-p it will paste onto current selection but will keep the clipboard
-- vim.keymap.set("x", "<leader>P", '"_dP', { noremap = false })

-- start with leader-d and it will not keep deleted contents
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { noremap = false })
vim.keymap.set({ "n", "v" }, "<leader>c", '"_c', { noremap = false })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+p', { noremap = true })
