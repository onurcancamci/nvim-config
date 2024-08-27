return {
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
          local current_cs = require("current-color-scheme")
          local vcs_hl = current_cs.vcs_hl_groups

          hl[vcs_hl.added] = { fg = colors.green }
          hl[vcs_hl.deleted] = { fg = colors.red }
          hl[vcs_hl.ignored] = { link = "@comment" }
          hl[vcs_hl.modified] = { fg = colors.orange }
          hl[vcs_hl.untracked] = { fg = colors.purple }

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
        macchiato = function(colors)
          return {
            Search = { fg = colors.text, bg = colors.overlay1 },
            WinSeparator = { fg = "#000000", bg = "#000000" },
            ColorColumn = { bg = "#0f0f17" },
            ["@tag.attribute.tsx"] = { fg = colors.lorange, style = {} },
            TelescopePromptBorder = { fg = colors.mauve },
            TelescopePromptTitle = { fg = colors.mauve },
          }
        end,
        latte = function(colors)
          return {
            Search = { fg = colors.text, bg = colors.overlay0 },
            WinSeparator = { fg = "#b6b7bf", bg = "#b6b7bf" },
            ColorColumn = { bg = "#dfe0e6" },
            ["@tag.attribute.tsx"] = { fg = colors.green, style = {} },
            TelescopePromptBorder = { fg = colors.red },
            TelescopePromptTitle = { fg = colors.red },
            TabLineSel = { fg = colors.green, bg = colors.surface0 },
            NeogitDiffContextCursor = { bg = colors.surface0 },
          }
        end,
        all = function(colors)
          local current_cs = require("current-color-scheme")
          local vcs_hl = current_cs.vcs_hl_groups
          return {
            CurSearch = { bg = colors.mauve },
            IncSearch = { bg = colors.mauve },
            LineNrBelow = { fg = colors.surface1 },
            LineNrAbove = { fg = colors.surface1 },
            LineNr = { fg = colors.blue, style = { "bold" } },

            Boolean = { fg = colors.pink },
            Number = { fg = colors.pink },
            Float = { fg = colors.pink },
            ["@property"] = { fg = colors.subtext1 },
            ["@parameter"] = { fg = colors.pink },
            ["@variable.parameter"] = { fg = colors.pink },
            ["@keyword.export"] = { link = "Import" },
            ["@lsp.type.interface"] = { fg = colors.maroon },
            ["@lsp.type.enum"] = { fg = colors.maroon },
            ["@type.builtin"] = { fg = colors.lavender },
            ["Function"] = { fg = colors.blue },
            ["@tag.tsx"] = { fg = colors.sky },
            ["Constant"] = { fg = colors.lavender },
            ["@constant.builtin"] = { fg = colors.pink },

            TabLine = { fg = colors.subtext1 },

            CmpItemAbbr = { fg = colors.text },
            CmpItemAbbrMatch = { fg = colors.blue },
            CmpItemMenu = { fg = colors.subtext0 },

            [vcs_hl.added] = { fg = colors.green },
            [vcs_hl.deleted] = { fg = colors.red },
            [vcs_hl.ignored] = { fg = colors.subtext0 },
            [vcs_hl.modified] = { fg = colors.mauve },
            [vcs_hl.untracked] = { fg = colors.pink },
          }
        end,
      },
      color_overrides = {
        macchiato = {
          dsteal = "#007d67",
          dssaphire = "#0061dd",
          dsorange = "#b34b1c",
          dspurple = "#6f11b7",
          rosewater = "#F5B8AB",
          flamingo = "#F29D9D",
          pink = "#d2a6ff",
          dpink = "#AD6FF7",
          mauve = "#FF8F40",
          lorange = "#ffb454",
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
