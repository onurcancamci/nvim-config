return {
  { "nvim-lua/plenary.nvim" },
  {
    "duane9/nvim-rg",
    config = function()
      vim.keymap.del("", "<leader>rg")
      vim.keymap.del("", "<leader>rw")
    end,
  },
}
