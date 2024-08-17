return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local harpoon = require("harpoon")
			harpoon.setup({
				-- menu = {
				-- 	width = 120,
				-- 	height = 20,
				-- },
				-- tabline = false,
			})

			vim.keymap.set("n", "<leader>a", function()
				local fname = vim.fn.expand("%")
				local val, idx = harpoon:list():get_by_value(fname)
				if idx == nil then
					harpoon:list():add()
					require("notify")("Added", "INFO", {
						render = "compact",
						animate = false,
						hide_from_history = true,
						timeout = 700,
						title = "Harpoon",
					})
				else
					harpoon:list():remove_at(idx)
					require("notify")("Removed", "INFO", {
						render = "compact",
						animate = false,
						hide_from_history = true,
						timeout = 700,
						title = "Harpoon",
					})
				end
			end)
			vim.keymap.set("n", "<leader>e", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<leader>5", function()
				harpoon:list():select(5)
			end)
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
}
