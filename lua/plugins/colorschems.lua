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
            LineNr = { fg = colors.blue, style = { "bold" } },
            WinSeparator = { fg = "#000000", bg = "#000000" },
            ColorColumn = { bg = "#0f0f17" },
            ["@tag.attribute.tsx"] = { fg = colors.lorange, style = {} },
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
            -- MatchParen = { bg = colors.base, fg = colors.blue },

            TelescopePromptBorder = { fg = colors.mauve },
            TelescopePromptTitle = { fg = colors.mauve },

            CmpItemKind = { bg = colors.surface2, fg = colors.text },
            -- CmpItemKindText = { bg = colors.surface2, fg = colors.text },
            -- CmpItemKindSnippet = { bg = colors.surface2, fg = colors.text },
            -- CmpItemKindOperator = { bg = colors.surface2, fg = colors.text },
            --
            -- CmpItemKindFunction = { bg = colors.dssaphire, fg = colors.text },
            -- CmpItemKindMethod = { bg = colors.dssaphire, fg = colors.text },
            -- CmpItemKindConstructor = { bg = colors.dssaphire, fg = colors.text },
            -- CmpItemKindEvent = { bg = colors.dssaphire, fg = colors.text },
            --
            -- CmpItemKindField = { bg = colors.dsteal, fg = colors.text },
            -- CmpItemKindProperty = { bg = colors.dsteal, fg = colors.text },
            -- CmpItemKindEnumMember = { bg = colors.dsteal, fg = colors.text },
            -- CmpItemKindVariable = { bg = colors.dsteal, fg = colors.text },
            --
            -- CmpItemKindClass = { bg = colors.dsorange, fg = colors.text },
            -- CmpItemKindModule = { bg = colors.dsorange, fg = colors.text },
            -- CmpItemKindFile = { bg = colors.dsorange, fg = colors.text },
            -- CmpItemKindFolder = { bg = colors.dsorange, fg = colors.text },
            -- CmpItemKindReference = { bg = colors.dsorange, fg = colors.text },
            -- CmpItemKindStruct = { bg = colors.dsorange, fg = colors.text },
            --
            -- CmpItemKindInterface = { bg = colors.dspink, fg = colors.text },
            -- CmpItemKindEnum = { bg = colors.dspink, fg = colors.text },
            -- CmpItemKindTypeParameter = { bg = colors.dspink, fg = colors.text },
            --
            -- CmpItemKindUnit = { bg = colors.dspurple, fg = colors.text },
            -- CmpItemKindValue = { bg = colors.dspurple, fg = colors.text },
            -- CmpItemKindColor = { bg = colors.dspurple, fg = colors.text },
            -- CmpItemKindKeyword = { bg = colors.dspurple, fg = colors.text },
            -- CmpItemKindConstant = { bg = colors.dspurple, fg = colors.text },

            -- CmpItemKindText = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindSnippet = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindOperator = { bg = colors.surface2, fg = colors.subtext0 },
            --
            -- CmpItemKindFunction = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindMethod = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindConstructor = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindEvent = { bg = colors.surface2, fg = colors.subtext0 },
            --
            -- CmpItemKindField = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindProperty = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindEnumMember = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindVariable = { bg = colors.surface2, fg = colors.subtext0 },
            --
            -- CmpItemKindClass = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindModule = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindFile = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindFolder = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindReference = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindStruct = { bg = colors.surface2, fg = colors.subtext0 },
            --
            -- CmpItemKindInterface = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindEnum = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindTypeParameter = {
            --   bg = colors.surface2,
            --   fg = colors.subtext0,
            -- },
            --
            -- CmpItemKindUnit = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindValue = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindColor = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindKeyword = { bg = colors.surface2, fg = colors.subtext0 },
            -- CmpItemKindConstant = { bg = colors.surface2, fg = colors.subtext0 },
            --

            CmpItemKindText = { fg = colors.subtext0 },
            CmpItemKindSnippet = { fg = colors.subtext0 },
            CmpItemKindOperator = { fg = colors.subtext0 },

            CmpItemKindFunction = { fg = colors.subtext0 },
            CmpItemKindMethod = { fg = colors.subtext0 },
            CmpItemKindConstructor = { fg = colors.subtext0 },
            CmpItemKindEvent = { fg = colors.subtext0 },

            CmpItemKindField = { fg = colors.subtext0 },
            CmpItemKindProperty = { fg = colors.subtext0 },
            CmpItemKindEnumMember = { fg = colors.subtext0 },
            CmpItemKindVariable = { fg = colors.subtext0 },

            CmpItemKindClass = { fg = colors.subtext0 },
            CmpItemKindModule = { fg = colors.subtext0 },
            CmpItemKindFile = { fg = colors.subtext0 },
            CmpItemKindFolder = { fg = colors.subtext0 },
            CmpItemKindReference = { fg = colors.subtext0 },
            CmpItemKindStruct = { fg = colors.subtext0 },

            CmpItemKindInterface = { fg = colors.subtext0 },
            CmpItemKindEnum = { fg = colors.subtext0 },
            CmpItemKindTypeParameter = {

              fg = colors.subtext0,
            },

            CmpItemKindUnit = { fg = colors.subtext0 },
            CmpItemKindValue = { fg = colors.subtext0 },
            CmpItemKindColor = { fg = colors.subtext0 },
            CmpItemKindKeyword = { fg = colors.subtext0 },
            CmpItemKindConstant = { fg = colors.subtext0 },

            --
            CmpItemAbbr = { fg = colors.text },
            CmpItemAbbrMatch = { fg = colors.blue, style = {} },
            CmpItemMenu = { fg = colors.subtext0 },

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
