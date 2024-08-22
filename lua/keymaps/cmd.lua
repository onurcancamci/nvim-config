vim.keymap.set("n", "<leader>vb", "<cmd>! pnpm run build<CR>")
vim.api.nvim_set_keymap(
  "n",
  "<leader>vd",
  "<cmd>vsplit | term tsc --noEmit<CR>",
  { noremap = true, silent = true }
)

vim.cmd([[
  cabbrev bterm <C-c> :botright term
]])

vim.cmd([[
  cabbrev vterm <C-c> :vert term
]])
