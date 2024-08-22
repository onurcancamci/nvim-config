vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy-init")
require("configs")
require("keymaps")

local p = vim.fn.expand("%:p:h")
vim.cmd("cd /" .. string.gsub(p, "oil:///", ""))
