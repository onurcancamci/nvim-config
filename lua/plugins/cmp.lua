return {
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
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
					-- { name = "luasnip" },
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
			cmp.setup.filetype({ "sql" }, {
				sources = {
					-- { name = "vim-dadbod-completion" },
					{ name = "cmp-dbee" },
					{ name = "buffer" },
				},
			})
		end,
	},
	{ "hrsh7th/cmp-calc" },
	{ "saadparwaiz1/cmp_luasnip" },
}
