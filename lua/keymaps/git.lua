local gitsigns = require("gitsigns")

vim.keymap.set("n", "<leader>hw", vim.cmd.Neogit)

vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
vim.keymap.set("n", "<leader>hr", gitsigns.undo_stage_hunk)
vim.keymap.set("n", "<leader>hv", "<cmd>DiffviewFileHistory %<CR>")
vim.keymap.set("n", "<leader>hc", "<cmd>DiffviewClose<CR>")

vim.keymap.set("n", "[h", function()
  gitsigns.nav_hunk("next")
end)
vim.keymap.set("n", "]h", function()
  gitsigns.nav_hunk("prev")
end)
