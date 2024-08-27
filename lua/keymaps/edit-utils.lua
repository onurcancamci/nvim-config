vim.keymap.set("n", "<leader><space>", "<cmd>noh<CR>", { noremap = true })

-- Shift Option O => make a new line up
vim.keymap.set("n", "Ø", "O<Esc>j", { noremap = false })
vim.keymap.set("n", "ø", "o<Esc>k", { noremap = false })

-- move lines in visual mode by shift up/down
-- vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")
-- vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<S-Up>", "<cmd>m '<-2<CR>gv=gv")
-- vim.keymap.set("v", "<S-Down>", "<cmd>m '>+1<CR>gv=gv")

-- regular cmd keys
vim.keymap.set("n", "<D-s>", "<cmd>w<CR>", { noremap = false })
vim.keymap.set("n", "<C-z>", "u")

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end)

vim.keymap.set(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)

-- vim.keymap.set("n", "<leader>M", ":delm a-z<CR>", { silent = true })

vim.keymap.set("v", "<leader>(", "<Esc>`>a)<Esc>`<i(<Esc>", {})
vim.keymap.set("v", "<leader>[", "<Esc>`>a]<Esc>`<i[<Esc>", {})
vim.keymap.set("v", "<leader>{", "<Esc>`>a}<Esc>`<i{<Esc>", {})
vim.keymap.set("v", "<leader><", "<Esc>`>a><Esc>`<i<<Esc>", {})
vim.keymap.set("v", "<leader>'", "<Esc>'>a}<Esc>'<i{<Esc>", {})
vim.keymap.set("v", '<leader>"', '<Esc>">a}<Esc>"<i{<Esc>', {})

vim.keymap.set("i", "<S-Left>", "<ESC>v<Left>")
vim.keymap.set("i", "<S-Right>", "<ESC>v<Right>")

vim.keymap.set({ "i", "n" }, "<M-h>", "<Left>")
vim.keymap.set({ "i", "n" }, "<M-j>", "<Down>")
vim.keymap.set({ "i", "n" }, "<M-k>", "<Up>")
vim.keymap.set({ "i", "n" }, "<M-l>", "<Right>")
