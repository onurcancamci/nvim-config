vim.keymap.set("n", "<leader>hw", vim.cmd.Neogit)
vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk)
vim.keymap.set("n", "<leader>hr", require("gitsigns").undo_stage_hunk)
