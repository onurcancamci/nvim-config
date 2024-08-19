return {
  "norcalli/nvim-colorizer.lua",

  config = function()
    vim.defer_fn(function()
      require("colorizer").setup({
        "css",
      }, { mode = "background" })
    end, 10)
  end,
}
