vim.keymap.set("n", "<M-left>", "<C-w>h")
vim.keymap.set("n", "<M-right>", "<C-w>l")
vim.keymap.set("n", "<M-up>", "<C-w>k")
vim.keymap.set("n", "<M-down>", "<C-w>j")

vim.keymap.set("n", "<leader>m", ":bn<CR>")
vim.keymap.set("n", "<leader>n", ":bp<CR>")

vim.keymap.set("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.keymap.set("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.keymap.set("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })
