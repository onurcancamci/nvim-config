vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
  pattern = { "*" },
  callback = function()
    vim.opt_local.fo:remove("o")
    vim.opt_local.fo:remove("r")
  end,
})

local p = vim.fn.expand("%:p:h")
vim.cmd("cd /" .. string.gsub(p, "oil:///", ""))
