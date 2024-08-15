return {
	{ "Shatur/neovim-ayu" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				-- use the night style
				style = "night",
				-- disable italic for functions
				styles = { comments = { italic = false }, keywords = { italic = false } },
				-- Change the "hint" color to the "orange" color, and make the "error" color bright red
				on_colors = function(colors)
					-- colors.hint = colors.orange
					-- colors.error = "#ff0000"
				end,
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "tokyonight" },
				-- options = { theme = "ayu" },
			})
		end,
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
}
