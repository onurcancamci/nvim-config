vim.g.is_copilot_enabled = false

function _G.toggle_copilot()
  if vim.g.is_copilot_enabled then
    vim.g.is_copilot_enabled = false
    vim.cmd("Copilot disable")
    print("Copilot is disabled")
  else
    vim.g.is_copilot_enabled = true
    vim.cmd("Copilot enable")
    print("Copilot is enabled")
  end
end

vim.keymap.set(
  "n",
  "<leader>hc",
  "<cmd>call v:lua.toggle_copilot()<CR>",
  { silent = true, noremap = true }
)
