return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				scope = {
					show_start = false,
					show_end = false,
				},
				indent = { char = "│" },
			})

			vim.defer_fn(function()
				-- MarkSignNumHL
				vim.cmd(":hi CursorLineNr None")
			end, 0)
		end,
	},
}
