local M = {}

M.colorscheme = "tokyonight"
M.lualine = "tokyonight"

vim.defer_fn(function()
  vim.cmd("highlight ColorColumn ctermbg=0 guibg=#282a3c")
  vim.cmd("highlight WinSeparator guibg=#000000 guifg=#000000")
  vim.cmd("highlight! link LineNr DiagnosticLineNrWarn")

  local function get_fg_color(group)
    return vim.fn.synIDattr(vim.fn.hlID(group), "fg")
  end

  local sign_colors = {
    red = get_fg_color("Error"), -- Red color
    yellow = get_fg_color("WarningMsg"), -- Yellow color
    green = get_fg_color("DiffAdd"), -- Green color
    cyan = get_fg_color("@property"), -- Cyan color
    blue = get_fg_color("Function"), -- Blue color
    magenta = get_fg_color("Statement"), -- Magenta color
  }

  vim.cmd(
    "highlight DiagnosticLineNrError guifg=" .. sign_colors.red .. " gui=bold"
  )
  vim.cmd(
    "highlight DiagnosticLineNrWarn guifg=" .. sign_colors.yellow .. " gui=bold"
  )
  vim.cmd(
    "highlight DiagnosticLineNrInfo guifg=" .. sign_colors.blue .. " gui=bold"
  )
  vim.cmd(
    "highlight DiagnosticLineNrHint guifg=" .. sign_colors.cyan .. " gui=bold"
  )

  vim.cmd("highlight! link OilVcsStatusAdded DiagnosticSignHint")
  vim.cmd("highlight! link OilVcsStatusCopied DiagnosticSignWarn")
  vim.cmd("highlight! link OilVcsStatusDeleted DiagnosticSignError")
  vim.cmd("highlight! link OilVcsStatusModified DiagnosticSignWarn")
  vim.cmd("highlight! link OilVcsStatusRenamed @function")
  vim.cmd("highlight! link OilVcsStatusTypeChanged @function")
  vim.cmd("highlight! link OilVcsStatusUnmerged @character")
  vim.cmd("highlight! link OilVcsStatusUntracked @keyword")
  vim.cmd("highlight! link OilVcsStatusUnmodified @comment")
  vim.cmd("highlight! link OilVcsStatusExternal @comment")
  vim.cmd("highlight! link OilVcsStatusIgnored @comment")

  vim.cmd("highlight! link OilVcsStatusUpstreamAdded DiagnosticSignHint")
  vim.cmd("highlight! link OilVcsStatusUpstreamCopied DiagnosticSignWarn")
  vim.cmd("highlight! link OilVcsStatusUpstreamDeleted DiagnosticSignError")
  vim.cmd("highlight! link OilVcsStatusUpstreamModified DiagnosticSignWarn")
  vim.cmd("highlight! link OilVcsStatusUpstreamRenamed @function")
  vim.cmd("highlight! link OilVcsStatusUpstreamTypeChanged @function")
  vim.cmd("highlight! link OilVcsStatusUpstreamUnmerged @character")
  vim.cmd("highlight! link OilVcsStatusUpstreamUntracked @keyword")
  vim.cmd("highlight! link OilVcsStatusUpstreamExternal @comment")
  vim.cmd("highlight! link OilVcsStatusUpstreamUnmodified @comment")
  vim.cmd("highlight! link OilVcsStatusUpstreamIgnored @comment")
end, 10)

return M
