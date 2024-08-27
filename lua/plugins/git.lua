return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        sign_priority = 10000,
        signs = {
          add = { text = "▌" }, -- ▌
          change = { text = "▌" },
          delete = { text = "▌" },
          topdelete = { text = "▌" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged = {
          add = { text = "▌" }, -- ▌
          change = { text = "▌" },
          delete = { text = "▌" },
          topdelete = { text = "▌" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
      })
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      {
        "sindrets/diffview.nvim",
        config = function()
          require("diffview").setup({})
        end,
      },

      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup({
        integrations = {
          diffview = true,
        },
      })
    end,
  },
}
