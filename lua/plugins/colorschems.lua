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
	-- { "Th3Whit3Wolf/onebuddy", opts = {}, priority = 1000, dependencies = { "tjdevries/colorbuddy.vim" } },
	{ "roflolilolmao/oceanic-next.nvim" },
}
