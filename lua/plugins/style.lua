local function get_harpoon_indicator(harpoon_entry)
	print("bbbbbb", harpoon_entry)
	return harpoon_entry.value
end

local function log_test(arg)
	print("aaaaaa", arg)
	return arg
end

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
				options = {
					theme = "tokyonight",
					globalstatus = false,
					component_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "diagnostics" },
					lualine_c = { "filename" },

					lualine_x = {
						{
							"harpoon2",
							icon = "󰀱",
							indicators = { "1", "2", "3", "4", "5" },
							active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]" },
							_separator = " ",
							no_harpoon = "Harpoon not loaded",
						},
						{ "%=" },
					},
					lualine_y = { "filetype" },
					lualine_z = {
						{
							"branch",
							-- color = { bg = "#f7768e" }
						},
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = {
						{
							"harpoon2",
							icon = "󰀱",
							indicators = { "1", "2", "3", "4", "5" },
							active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]" },
							_separator = " ",
							no_harpoon = "Harpoon not loaded",
						},
						{ "%=" },
					},
					lualine_y = { "filetype" },
					lualine_z = {},
				},

				-- options = { theme = "ayu" },
			})
		end,
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
}
