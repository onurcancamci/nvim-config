local M = {}

function M.keymaps(args)
  local bufnr = args.buf
  local opts = { buffer = bufnr }
  local telescope = require("telescope.builtin")

  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
  -- vim.keymap.set("n", "gD", telescope.lsp_definitions, opts)
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
  vim.keymap.set("n", "go", telescope.lsp_type_definitions, opts)
  vim.keymap.set("n", "gr", telescope.lsp_references, opts)
  vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  vim.keymap.set("n", "gca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({
      count = -1,
      float = true,
      severity = { vim.diagnostic.severity.ERROR },
    })
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({
      count = 1,
      float = true,
      severity = { vim.diagnostic.severity.ERROR },
    })
  end, opts)
  vim.keymap.set("n", "[D", function()
    vim.diagnostic.jump({
      count = -1,
      float = true,
    })
  end, opts)
  vim.keymap.set("n", "]D", function()
    vim.diagnostic.jump({
      count = 1,
      float = true,
    })
  end, opts)
end

M.defineLspOverloads = function()
  vim.keymap.set("n", "gS", "<cmd>LspOverloadsSignature<CR>")
  vim.keymap.set("i", "<C-s>", "<cmd>LspOverloadsSignature<CR>")
end

vim.keymap.del("n", "grn")
vim.keymap.del({ "v", "n" }, "gra")
vim.keymap.del("n", "grr")
return M
