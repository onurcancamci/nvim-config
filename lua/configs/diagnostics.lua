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

vim.api.nvim_set_hl(0, "DiagnosticLineNrError", { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "DiagnosticLineNrWarn", { link = "DiagnosticWarn" })
vim.api.nvim_set_hl(0, "DiagnosticLineNrInfo", { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "DiagnosticLineNrHint", { link = "DiagnosticHint" })

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
  "<cmd>call v:lua.toggle_diagnostics()<CR>",
  { silent = true, noremap = true }
)
