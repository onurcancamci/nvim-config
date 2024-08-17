local M = {}

function M.keymaps(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
	vim.keymap.set("n", "gS", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts)
end

return M
