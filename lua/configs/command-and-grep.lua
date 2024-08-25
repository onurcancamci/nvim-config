vim.cmd([[
  cabbrev bterm <C-c> :botright term
]])

vim.cmd([[
  cabbrev Grep copen \| silent! grep!
]])

vim.cmd([[
  cabbrev vterm <C-c> :vert term
]])

vim.cmd([[set grepprg=rg\ --vimgrep\ --smart-case\ --hidden]])
vim.cmd([[set grepformat=%f:%l:%c:%m]])
