return {
	{ "nvim-lua/plenary.nvim" },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			require("harpoon").setup({
				-- menu = {
				-- 	width = 120,
				-- 	height = 20,
				-- },
				-- tabline = false,
			})
		end,
	},
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
	-- {
	-- 	"NeogitOrg/neogit",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- required
	-- 		"sindrets/diffview.nvim", -- optional - Diff integration
	--
	-- 		-- Only one of these is needed, not both.
	-- 		"nvim-telescope/telescope.nvim", -- optional
	-- 		"ibhagwan/fzf-lua", -- optional
	-- 	},
	-- 	config = true,
	-- },
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				stages = "static",
			})
		end,
	},
	{
		"princejoogie/dir-telescope.nvim",
		-- telescope.nvim is a required dependency
		requires = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("dir-telescope").setup({
				-- these are the default options set
				hidden = true,
				no_ignore = false,
				show_preview = true,
			})
		end,
	},
	{
		"letieu/harpoon-lualine",
		dependencies = {
			{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
			},
		},
	},
	-- {
	-- 	"echasnovski/mini.surround",
	-- 	opts = {
	-- 		mappings = {
	-- 			add = "gsa",
	-- 			delete = "gsd",
	-- 			find = "gsf",
	-- 			find_left = "gsF",
	-- 			highlight = "gsh",
	-- 			replace = "gsr",
	-- 			update_n_lines = "gsn",
	-- 		},
	-- 	},
	-- },
}
