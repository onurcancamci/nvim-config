require("marks").setup({
	-- whether to map keybinds or not. default true
	default_mappings = true,
	-- which builtin marks to show. default {}
	builtin_marks = { ".", "<", ">", "^" },
	-- whether movements cycle back to the beginning/end of buffer. default true
	cyclic = true,
	-- whether the shada file is updated after modifying uppercase marks. default false
	force_write_shada = false,
	-- how often (in ms) to redraw signs/recompute mark positions.
	-- higher values will have better performance but may cause visual lag,
	-- while lower values may cause performance penalties. default 150.
	refresh_interval = 250,
	-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
	-- marks, and bookmarks.
	-- can be either a table with all/none of the keys, or a single number, in which case
	-- the priority applies to all marks.
	-- default 10.
	sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	-- disables mark tracking for specific filetypes. default {}
	excluded_filetypes = {},
	-- disables mark tracking for specific buftypes. default {}
	excluded_buftypes = {},
	-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
	-- sign/virttext. Bookmarks can be used to group together positions and quickly move
	-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
	-- default virt_text is "".
	bookmark_0 = {
		sign = "⚑",
	},
	bookmark_1 = {
		sign = "",
	},
	bookmark_2 = {
		sign = "",
	},
	mappings = {},
})

require("ibl").setup({
	scope = {
		show_start = false,
		show_end = false,
	},
	indent = { char = "│" },
})

-- MarkSignNumHL
vim.cmd(":hi CursorLineNr None")

local Path = require("plenary.path")
local function normalize_path(buf_name, root)
	return Path:new(buf_name):make_relative(root)
end
local get_root_dir = function()
	return vim.loop.cwd()
end

local function make_harpoon_list_item(name)
	name = name or normalize_path(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), get_root_dir())

	local bufnr = vim.fn.bufnr(name, false)

	local pos = { 1, 0 }
	if bufnr ~= -1 then
		pos = vim.api.nvim_win_get_cursor(0)
	end

	return {
		value = name,
		context = {
			row = pos[1],
			col = pos[2],
		},
	}
end

require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		-- media_files = {
		-- 	-- filetypes whitelist
		-- 	-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
		-- 	filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
		-- 	-- find command (defaults to `fd`)
		-- 	find_cmd = "timg",
		-- },
	},
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				["<C-h>"] = "which_key",
				["<C-e>"] = function(arg1)
					local selection = require("telescope.actions.state").get_selected_entry()
					local harpoon = require("harpoon")
					local fname = vim.fn.fnamemodify(selection.path, ":.")
					local item = make_harpoon_list_item(fname)
					local _, idx = harpoon:list():get_by_value(item.value)

					if idx == nil then
						harpoon:list():add(item)
						require("notify")("Added", "INFO", {
							render = "compact",
							animate = false,
							hide_from_history = true,
							timeout = 700,
							title = "Harpoon",
						})
					else
						harpoon:list():remove(item)
						require("notify")("Removed", "INFO", {
							render = "compact",
							animate = false,
							hide_from_history = true,
							timeout = 700,
							title = "Harpoon",
						})
					end
				end,
			},
			n = {
				["<c-d>"] = function(arg)
					vim.api.nvim_command("wall")
					require("telescope.actions").delete_buffer(arg)
				end,
				["<C-e>"] = function(arg1)
					local selection = require("telescope.actions.state").get_selected_entry()
					local harpoon = require("harpoon")
					local fname = vim.fn.fnamemodify(selection.path, ":.")
					local item = make_harpoon_list_item(fname)
					local _, idx = harpoon:list():get_by_value(item.value)

					if idx == nil then
						harpoon:list():add(item)
						require("notify")("Added", "INFO", {
							render = "compact",
							animate = false,
							hide_from_history = true,
							timeout = 700,
							title = "Harpoon",
						})
					else
						harpoon:list():remove(item)
						require("notify")("Removed", "INFO", {
							render = "compact",
							animate = false,
							hide_from_history = true,
							timeout = 700,
							title = "Harpoon",
						})
					end
				end,
			},
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("dir")
