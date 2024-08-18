local default_diagnostics = {
  virtual_text = {
    severity = { vim.diagnostic.severity.ERROR },
  },
  underline = {
    severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticLineNrError",
      [vim.diagnostic.severity.WARN] = "DiagnosticLineNrWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticLineNrHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticLineNrInfo",
    },
  },
}

local hidden_diagnostics = {
  virtual_text = false,
  underline = {
    severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticLineNrError",
      [vim.diagnostic.severity.WARN] = "DiagnosticLineNrWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticLineNrHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticLineNrInfo",
    },
  },
}

-- vim.diagnostic.config({
--   virtual_text = false,
-- })
vim.diagnostic.config(default_diagnostics)

vim.g.diagnostics_visible = true

function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.config(hidden_diagnostics)
    print("Diagnostics are hidden")
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.config(default_diagnostics)
    print("Diagnostics are visible")
  end
end

vim.keymap.set(
  "n",
  "<leader>hd",
  ":call v:lua.toggle_diagnostics()<CR>",
  { silent = true, noremap = true }
)

local function get_fg_color(group)
  return vim.fn.synIDattr(vim.fn.hlID(group), "fg")
end

-- Retrieve key colors from tokyonight
local colors = {
  red = get_fg_color("Error"), -- Red color
  yellow = get_fg_color("WarningMsg"), -- Yellow color
  green = get_fg_color("DiffAdd"), -- Green color
  cyan = get_fg_color("@property"), -- Cyan color
  blue = get_fg_color("Function"), -- Blue color
  magenta = get_fg_color("Statement"), -- Magenta color
}

vim.cmd("highlight DiagnosticLineNrError guifg=" .. colors.red .. " gui=bold")
vim.cmd("highlight DiagnosticLineNrWarn guifg=" .. colors.yellow .. " gui=bold")
vim.cmd("highlight DiagnosticLineNrInfo guifg=" .. colors.blue .. " gui=bold")
vim.cmd("highlight DiagnosticLineNrHint guifg=" .. colors.cyan .. " gui=bold")

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[
      highlight! link DiagnosticLineNrError DiagnosticError
      highlight! link DiagnosticLineNrWarn DiagnosticWarn
      highlight! link DiagnosticLineNrInfo DiagnosticInfo
      highlight! link DiagnosticLineNrHint DiagnosticHint
    ]])
  end,
})
