vim.keymap.set("n", "<leader>vb", "<cmd>! pnpm run build<CR>")
vim.keymap.set("n", "<leader>vI", "<cmd>! pnpm run install:all<CR>")
vim.keymap.set("n", "<leader>vi", "<cmd>! pnpm install<CR>")
vim.keymap.set("n", "<leader>vD", "<cmd>! pnpm run dev:all<CR>")

vim.keymap.set(
  "n",
  "<leader>vd",
  "<cmd>vsplit | term tsc --noEmit<CR>",
  { noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>vgb", function()
  require("oil").open("./Backend")
end, { desc = "v go backend (open in oil)" })

vim.keymap.set("n", "<leader>vg-", function()
  require("oil").open(".")
end, { desc = "v go project dir (open in oil)" })
