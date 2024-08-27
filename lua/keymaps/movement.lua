-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
-- vim.keymap.set("n", "<C-f>", "<C-u>zz", { noremap = true })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set("n", "<C-d>", "10j", { noremap = true })
vim.keymap.set("n", "<C-f>", "10k", { noremap = true })
vim.keymap.set("n", "<C-u>", "10k", { noremap = true })

-- center after search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- center after G
vim.keymap.set({ "n", "v" }, "G", "Gzz")
vim.keymap.set("n", "\\", ";", { noremap = true })
