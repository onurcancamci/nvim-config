local harpoon = require("harpoon")

vim.keymap.set("n", "S", "s", { noremap = true })

vim.keymap.set("n", "s", ":w|lua vim.defer_fn( function()vim.cmd('echom \"\"') end, 0)<CR>", { noremap = false })

vim.keymap.set("n", "<leader><space>", ":noh<CR>", { noremap = true })

-- vim.keymap.set("n", "<leader>s", "ysiw", { noremap = false })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-f>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- if pressed leader-p it will paste onto current selection but will keep the clipboard
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = false })

-- start with leader-d and it will not keep deleted contents
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { noremap = false })
vim.keymap.set({ "n", "v" }, "<leader>c", '"_c', { noremap = false })

-- Shift Option O => make a new line up
vim.keymap.set("n", "Ø", "O<Esc>j", { noremap = false })
vim.keymap.set("n", "ø", "o<Esc>k", { noremap = false })

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", ";", builtin.find_files, {})

-- vim.keymap.set("n", "<leader>pe", function()
-- 	require("oil").open(vim.fn.expand("%:p:h"))
-- end)
vim.keymap.set("n", "<leader>pE", function()
	vim.cmd("vsplit | wincmd h")
	require("oil").open()
	vim.cmd("vertical resize 40")
	vim.cmd("set wfw")
end)
vim.keymap.set("n", "<leader>pe", "<cmd>Oil --float .<CR>", {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>pF", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pm", "<cmd>Telescope marks mark_type=all<CR>", {})
vim.keymap.set("n", "<leader>bw", "40<C-w>|:set wfw<CR>")

-- vim.keymap.set("n", "<C-p>", builtin.git_files, {})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

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

-- vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<M-left>", "<C-w>h")
vim.keymap.set("n", "<M-right>", "<C-w>l")
vim.keymap.set("n", "<M-up>", "<C-w>k")
vim.keymap.set("n", "<M-down>", "<C-w>j")

vim.keymap.set("n", "<leader>m", ":bn<CR>")
vim.keymap.set("n", "<leader>n", ":bp<CR>")

-- move lines in visual mode by shift up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")

-- center after search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- center after G
vim.keymap.set({ "n", "v" }, "G", "Gzz")

-- regular cmd keys
vim.keymap.set("n", "<D-s>", ":w<CR>", { noremap = false })
-- vim.keymap.set("n", "<D-z>", "u", { noremap = false })
vim.keymap.set("n", "<C-z>", "u")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end)

vim.keymap.set("n", "<leader>S", ":mksession! save.vim<CR>:wall|qa!<CR>")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<leader>M", ":delm a-z<CR>", { silent = true })

vim.keymap.set("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.keymap.set("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.keymap.set("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
