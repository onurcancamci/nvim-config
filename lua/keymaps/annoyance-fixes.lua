vim.keymap.set("n", "<leader>bw", "40<C-w>|<cmd>set wfw<CR>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "n", "v" }, "<BS>", "^")

vim.cmd("aunmenu PopUp.How-to\\ disable\\ mouse")
vim.cmd("aunmenu PopUp.-1-")
