return {
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
					natural_order = true,
				},
				watch_for_changes = false,
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
