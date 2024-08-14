return {
	{ "Shatur/neovim-ayu" },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
}
