local M = {}

-- M.colorscheme = "tokyonight"
M.colorscheme = "catppuccin-macchiato"
-- M.colorscheme = "catppuccin-latte"

M.lualine = M.colorscheme

M.vcs_hl_groups = {
  added = "VcsAdded",
  ignored = "VcsIgnored",
  modified = "VcsModified",
  deleted = "VcsDeleted",
  untracked = "VcsUntracked",
}

M.kind_icons = {
  -- gray
  Text = "  ",

  -- blue
  Method = " 󰆧 ",
  Function = " 󰊕 ",
  Constructor = "  ",
  Event = "  ",

  -- teal
  Field = " 󰇽 ",
  Property = " 󰜢 ",
  EnumMember = "  ",
  Variable = " 󰂡 ",

  -- orange
  Class = " 󰠱 ",
  Module = "  ",
  File = " 󰈙 ",
  Folder = " 󰉋 ",
  Reference = "  ",
  Struct = "  ",

  -- pink
  Interface = "  ",
  Enum = "  ",
  TypeParameter = " 󰅲 ",

  -- purple
  Unit = "  ",
  Value = " 󰎠 ",
  Color = " 󰏘 ",
  Keyword = " 󰌋 ",
  Constant = " 󰏿 ",

  Snippet = "  ",
  Operator = " 󰆕 ",
}

return M
