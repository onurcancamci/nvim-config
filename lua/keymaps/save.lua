vim.keymap.set("n", "S", "s", { noremap = true })
vim.keymap.set(
  "n",
  "s",
  ":w|lua vim.defer_fn( function()vim.cmd('echom \"\"') end, 0)<CR>",
  { noremap = false }
)
vim.keymap.set("n", "<leader>S", ":mksession! save.vim<CR>:wall|qa!<CR>")
