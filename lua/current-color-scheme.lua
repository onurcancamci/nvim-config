local M = {}

M.colorscheme = "tokyonight"
M.lualine = "tokyonight"

vim.defer_fn(function()
	-- vim.cmd("highlight ColorColumn ctermbg=0 guibg=#282a3c")
end, 10)

return M
