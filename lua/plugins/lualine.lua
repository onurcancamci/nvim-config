return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local cs = require("current-color-scheme")

    local theme = cs.lualine

    if theme == "catppuccin-macchiato" then
      local custom_catpuccin = require("lualine.themes.catppuccin-macchiato")
      custom_catpuccin.visual.a.bg = "#AD6FF7"
      custom_catpuccin.visual.b.fg = "#AD6FF7"
      theme = custom_catpuccin
    end

    require("lualine").setup({
      options = {
        theme = theme,
        globalstatus = false,
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diagnostics" },
        lualine_c = { "diff", { "filename", path = 1 } },

        lualine_x = {
          {
            "harpoon2",
            icon = "󰀱",
            indicators = { "1", "2", "3", "4", "5" },
            active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]" },
            _separator = " ",
            no_harpoon = "Harpoon not loaded",
          },
          { "%=" },
        },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          {

            "branch",
            -- color = { bg = "#f7768e" }
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          {
            "harpoon2",
            icon = "󰀱",
            indicators = { "1", "2", "3", "4", "5" },
            active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]" },
            _separator = " ",
            no_harpoon = "Harpoon not loaded",
          },
          { "%=" },
        },
        lualine_y = { "filetype" },
        lualine_z = { "progress" },
      },

      -- options = { theme = "ayu" },
    })
  end,
}
