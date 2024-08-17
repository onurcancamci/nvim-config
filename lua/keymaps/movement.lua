-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
-- vim.keymap.set("n", "<C-f>", "<C-u>zz", { noremap = true })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set("n", "<C-d>", "15j", { noremap = true })
vim.keymap.set("n", "<C-f>", "15k", { noremap = true })
vim.keymap.set("n", "<C-u>", "15k", { noremap = true })

-- center after search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- center after G
vim.keymap.set({ "n", "v" }, "G", "Gzz")
