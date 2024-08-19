return {
  { "Shatur/neovim-ayu" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        -- use the night style
        style = "night",
        -- disable italic for functions
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        on_colors = function(colors) end,
        on_highlights = function(hl, colors)
          hl.OilVcsStatusAdded = { fg = colors.green }
          hl.OilVcsStatusCopied = { fg = colors.orange }
          hl.OilVcsStatusDeleted = { fg = colors.red }
          hl.OilVcsStatusModified = { fg = colors.orange }
          hl.OilVcsStatusRenamed = { fg = colors.blue }
          hl.OilVcsStatusTypeChanged = { fg = colors.blue }
          hl.OilVcsStatusUnmerged = { fg = colors.red }
          hl.OilVcsStatusUntracked = { fg = colors.purple }

          hl.OilVcsStatusUpstreamAdded = { fg = colors.green }
          hl.OilVcsStatusUpstreamCopied = { fg = colors.orange }
          hl.OilVcsStatusUpstreamDeleted = { fg = colors.red }
          hl.OilVcsStatusUpstreamModified = { fg = colors.orange }
          hl.OilVcsStatusUpstreamRenamed = { fg = colors.blue }
          hl.OilVcsStatusUpstreamTypeChanged = { fg = colors.blue }
          hl.OilVcsStatusUpstreamUnmerged = { fg = colors.red }
          hl.OilVcsStatusUpstreamUntracked = { fg = colors.purple }
          hl.ColorColumn = { bg = "#28213c" }
          hl.WinSeperator = { fg = "#000000", bg = "#000000" }
          hl.LineNr = { fg = colors.orange }
        end,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      highlight_overrides = {
        all = function(colors)
          return {
            CurSearch = { bg = colors.sky },
            IncSearch = { bg = colors.sky },
            -- CursorLineNr = { fg = colors.blue, style = { "bold" } },
            DashboardFooter = { fg = colors.overlay0 },
            TreesitterContextBottom = { style = {} },
            Conditional = { style = {} },

            ["@markup.italic"] = { fg = colors.blue },
            ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
            Headline = { style = { "bold" } },
            Headline1 = { fg = colors.blue, style = { "bold" } },
            Headline2 = { fg = colors.pink, style = { "bold" } },
            Headline3 = { fg = colors.lavender, style = { "bold" } },
            Headline4 = { fg = colors.green, style = { "bold" } },
            Headline5 = { fg = colors.peach, style = { "bold" } },
            Headline6 = { fg = colors.flamingo, style = { "bold" } },
            rainbow1 = { fg = colors.blue, style = { "bold" } },
            rainbow2 = { fg = colors.pink, style = { "bold" } },
            rainbow3 = { fg = colors.lavender, style = { "bold" } },
            rainbow4 = { fg = colors.green, style = { "bold" } },
            rainbow5 = { fg = colors.peach, style = { "bold" } },
            rainbow6 = { fg = colors.flamingo, style = { "bold" } },

            LineNrBelow = { fg = "#2f313d" },
            LineNrAbove = { fg = "#2f313d" },
            ["@tag.tsx"] = { fg = colors.blue },
            LineNr = { fg = colors.blue, style = { "bold" } },
            WinSeparator = { fg = "#000000", bg = "#000000" },
            ColorColumn = { bg = "#0f0f17" },

            OilVcsStatusAdded = { fg = colors.green },
            OilVcsStatusCopied = { fg = colors.mauve },
            OilVcsStatusDeleted = { fg = colors.red },
            OilVcsStatusModified = { fg = colors.mauve },
            OilVcsStatusRenamed = { fg = colors.blue },
            OilVcsStatusTypeChanged = { fg = colors.blue },
            OilVcsStatusUnmerged = { fg = colors.red },
            OilVcsStatusUntracked = { fg = colors.pink },

            OilVcsStatusUpstreamAdded = { fg = colors.green },
            OilVcsStatusUpstreamCopied = { fg = colors.mauve },
            OilVcsStatusUpstreamDeleted = { fg = colors.red },
            OilVcsStatusUpstreamModified = { fg = colors.mauve },
            OilVcsStatusUpstreamRenamed = { fg = colors.blue },
            OilVcsStatusUpstreamTypeChanged = { fg = colors.blue },
            OilVcsStatusUpstreamUnmerged = { fg = colors.red },
            OilVcsStatusUpstreamUntracked = { fg = colors.pink },
            OilVcsStatusUpstreamUnmodified = {},
          }
        end,
      },
      color_overrides = {
        macchiato = {
          rosewater = "#F5B8AB",
          flamingo = "#F29D9D",
          pink = "#AD6FF7",
          mauve = "#FF8F40",
          red = "#E66767",
          maroon = "#EB788B",
          peach = "#FAB770",
          yellow = "#FACA64",
          green = "#70CF67",
          teal = "#4CD4BD",
          sky = "#61BDFF",
          sapphire = "#4BA8FA",
          blue = "#00BFFF",
          lavender = "#00BBCC",
          text = "#C1C9E6",
          subtext1 = "#A3AAC2",
          subtext0 = "#8E94AB",
          overlay2 = "#7D8296",
          overlay1 = "#676B80",
          overlay0 = "#464957",
          surface2 = "#3A3D4A",
          surface1 = "#2F313D",
          surface0 = "#1D1E29",
          base = "#0b0b12",
          mantle = "#11111a",
          crust = "#191926",
        },
      },
      integrations = {
        telescope = {
          enabled = true,
          -- style = "nvchad",
        },
      },
    },
  },
  -- { "Th3Whit3Wolf/onebuddy", opts = {}, priority = 1000, dependencies = { "tjdevries/colorbuddy.vim" } },
  { "roflolilolmao/oceanic-next.nvim" },
}
