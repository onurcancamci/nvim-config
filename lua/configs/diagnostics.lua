vim.diagnostic.config({
  virtual_text = {
    severity = { vim.diagnostic.severity.ERROR },
  },
  underline = {
    severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
  },
  signs = {
    severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
  },
})

vim.g.diagnostics_visible = true

function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
        },
      },
      underline = {
        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
        },
      },
    })
    print("Diagnostics are hidden")
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.config({
      virtual_text = {
        severity = { vim.diagnostic.severity.ERROR },
      },
      signs = {
        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
        },
      },
      underline = {
        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
        },
      },
    })
    print("Diagnostics are visible")
  end
end

vim.keymap.set(
  "n",
  "<leader>hd",
  ":call v:lua.toggle_diagnostics()<CR>",
  { silent = true, noremap = true }
)
