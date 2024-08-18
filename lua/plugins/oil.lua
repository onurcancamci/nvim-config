return {
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      {
        "echasnovski/mini.icons",
        opts = {},
        config = function()
          require("mini.icons").setup({
            directory = {
              dist = { hl = "MiniIconsRed" },
            },
            file = {
              ["index.ts"] = { hl = "MiniIconsPurple" },
              [".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
              [".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
              [".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
              ["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
              ["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
              ["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
              ["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
              ["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
            },
            extension = {
              ["page.tsx"] = { hl = "MiniIconsOrange" },
              ["util.ts"] = { hl = "MiniIconsGreen" },
            },
          })
        end,
      },
    },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
        },
        watch_for_changes = false,
        win_options = {
          -- signcolumn = "yes:1",
        },
      })
      vim.keymap.set(
        "n",
        "-",
        "<CMD>Oil<CR>",
        { desc = "Open parent directory" }
      )
    end,
  },
  {
    "refractalize/oil-git-status.nvim",

    dependencies = {
      "stevearc/oil.nvim",
    },

    config = function()
      require("oil-git-status").setup({
        show_ignored = true, -- show files that match gitignore with !!
        -- symbols = {
        -- 	index = {
        -- 		["!"] = "i",
        -- 		["?"] = "?",
        -- 		["A"] = "A",
        -- 		["C"] = "C",
        -- 		["D"] = "D",
        -- 		["M"] = "M",
        -- 		["R"] = "R",
        -- 		["T"] = "T",
        -- 		["U"] = "U",
        -- 		[" "] = " ",
        -- 	},
        -- 	working_tree = {
        -- 		["!"] = "i",
        -- 		["?"] = "?",
        -- 		["A"] = "A",
        -- 		["C"] = "C",
        -- 		["D"] = "D",
        -- 		["M"] = "M",
        -- 		["R"] = "R",
        -- 		["T"] = "T",
        -- 		["U"] = "U",
        -- 		[" "] = " ",
        -- 	},
        -- },
      })
    end,
  },
}
