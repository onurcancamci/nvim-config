return {
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({
        default_mappings = true,
        builtin_marks = { ".", "<", ">", "^" },
        cyclic = true,
        force_write_shada = false,
        refresh_interval = 250,
        sign_priority = { lower = 2, upper = 3, builtin = 1, bookmark = 4 },
        excluded_filetypes = {},
        excluded_buftypes = {
          "nofile",
        },
        bookmark_0 = {
          sign = "⚑",
        },
        bookmark_1 = {
          sign = "",
        },
        bookmark_2 = {
          sign = "",
        },
        mappings = {},
      })
    end,
  },
}
