return {
	{ "ThePrimeagen/harpoon" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{ "terrortylor/nvim-comment" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- { "windwp/nvim-ts-autotag" },
	{ "onurcancamci/nvim-ts-autotag" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{ "chentoast/marks.nvim" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
}
