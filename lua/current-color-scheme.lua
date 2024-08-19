local M = {}

-- M.colorscheme = "tokyonight"
M.colorscheme = "catppuccin-macchiato"
-- M.lualine = "tokyonight"
M.lualine = "catppuccin-macchiato"

vim.defer_fn(function()
  vim.cmd("highlight! link OilVcsStatusUnmodified @comment")
  vim.cmd("highlight! link OilVcsStatusExternal @comment")
  vim.cmd("highlight! link OilVcsStatusIgnored @comment")
  vim.cmd("highlight! link OilVcsStatusUpstreamExternal @comment")
  vim.cmd("highlight! link OilVcsStatusUpstreamIgnored @comment")
end, 10)

return M
