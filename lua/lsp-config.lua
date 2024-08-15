local lsp = require("lsp-zero")
local cmp = require("cmp")

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
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

lsp.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

require("mason").setup({})
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

local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

cmp.setup({
	sources = {
		{ name = "calc" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-k>"] = cmp.mapping({
			i = function()
				if cmp.visible() then
					cmp.abort()
				else
					cmp.complete()
				end
			end,
			c = function()
				if cmp.visible() then
					cmp.close()
				else
					cmp.complete()
				end
			end,
		}),
	}),
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			-- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatenates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
				calc = "[Calc]",
			})[entry.source.name]
			return vim_item
		end,
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		tsx = { "prettierd", "prettier", stop_after_first = true },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

require("nvim_comment").setup({})

vim.diagnostic.config({
	virtual_text = {
		severity = { vim.diagnostic.severity.ERROR },
	},
	signs = {
		severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
	},
	-- underline = {
	-- 	severity = { vim.diagnostic.severity.ERROR },
	-- },
})

vim.g.diagnostics_visible = true

function _G.toggle_diagnostics()
	if vim.g.diagnostics_visible then
		vim.g.diagnostics_visible = false
		vim.diagnostic.config({
			virtual_text = false,
			signs = {
				severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
			},
			-- underline = {
			-- 	severity = { vim.diagnostic.severity.ERROR },
			-- },
		})
		print("Diagnostics are hidden")
	else
		vim.g.diagnostics_visible = true
		vim.diagnostic.config({
			virtual_text = {
				severity = { vim.diagnostic.severity.ERROR },
			},
			signs = {
				severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
			},
			-- underline = {
			-- 	severity = { vim.diagnostic.severity.ERROR },
			-- },
		})
		print("Diagnostics are visible")
	end
end

vim.keymap.set("n", "<leader>hd", ":call v:lua.toggle_diagnostics()<CR>", { silent = true, noremap = true })

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = true, -- Auto close on trailing </
	},
})
