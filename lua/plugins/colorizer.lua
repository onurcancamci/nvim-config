return {
  "NvChad/nvim-colorizer.lua",

  config = function()
    require("colorizer").setup({
      filetypes = { "css" },
      user_default_options = {
        css = true,
        names = false,
        mode = "background",
        tailwind = false,
        virtualtext = "████ Color",
      },
    })
  end,
}
