-- require("quarto").activate()

vim.opt.conceallevel = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.md",
  group = vim.api.nvim_create_augroup("markdown-only", {}),
  callback = function()
    print("aaaaaaaaaaaaa")
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.defer_fn(function()
  vim.opt.tabstop = 2
  vim.opt.softtabstop = 2
  vim.opt.shiftwidth = 2
end, 10)
