local M = {}

-- M.colorscheme = "tokyonight"
-- M.colorscheme = "catppuccin-macchiato"
M.colorscheme = "catppuccin-latte"

M.lualine = M.colorscheme

M.vcs_hl_groups = {
  added = "VcsAdded",
  ignored = "VcsIgnored",
  modified = "VcsModified",
  deleted = "VcsDeleted",
  untracked = "VcsUntracked",
}

return M
