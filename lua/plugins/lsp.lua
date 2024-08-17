return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		config = function()
			local lsp = require("lsp-zero")
			local lspk = require("keymaps.lsp")

			lsp.extend_lspconfig({
				sign_text = true,
				lsp_attach = lspk.keymaps,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,
	}, --
	{ "neovim/nvim-lspconfig" }, --
	{ "hrsh7th/cmp-nvim-lsp" }, --
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		priority = 10,
		config = function()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						if server_name == "lua_ls" then
							require("lspconfig").lua_ls.setup({
								settings = { Lua = { diagnostics = { globals = { "vim" } } } },
							})
						else
							require("lspconfig")[server_name].setup({})
						end
					end,
				},
			})
		end,
	},
}
