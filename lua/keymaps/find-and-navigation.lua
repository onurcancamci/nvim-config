local telescope = require("telescope.builtin")

-- vim.keymap.set("n", "<leader>pf", telescope.find_files, {})
vim.keymap.set("n", ";", telescope.find_files, {})

-- vim.keymap.set("n", "<leader>pe", function()
-- 	require("oil").open(vim.fn.expand("%:p:h"))
-- end)
vim.keymap.set("n", "<leader>pE", function()
  vim.cmd("vsplit | wincmd h")
  require("oil").open()
  vim.cmd("vertical resize 40")
  vim.cmd("set wfw")
end)
vim.keymap.set("n", "<leader>pe", "<cmd>Oil --float <CR>", {})
vim.keymap.set("n", "<leader>pg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>pG", telescope.grep_string, {})
vim.keymap.set("n", "<leader>pr", telescope.resume, {})
vim.keymap.set("n", "<leader>pb", telescope.buffers, {})
vim.keymap.set("n", "<leader>pd", telescope.diagnostics, {})
vim.keymap.set("n", "<leader>pc", telescope.git_status, {})
vim.keymap.set(
  "n",
  "<leader>pf",
  "<cmd>Telescope dir find_files<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>pm", "<cmd>Telescope marks mark_type=all<CR>", {})
vim.keymap.set("n", "<leader>pqf", telescope.quickfix, {}) -- project quick fix
-- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>ps", function()
  telescope.lsp_document_symbols({
    symbols = { "function", "class", "method", "interface", "enum", "struct" },
  })
end)

vim.api.nvim_create_user_command("Search", function(opts)
  require("telescope.builtin").live_grep({ default_text = opts.args })
end, { nargs = 1 })

vim.keymap.set("v", "<leader>pg", '"zy<cmd>Search <C-r>z<CR>')
vim.keymap.set("n", "<leader>p?", "<cmd>Telescope keymaps<CR>")
vim.keymap.set("n", "<leader>ph", "<cmd>Telescope highlights<CR>")
