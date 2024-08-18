return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local cs = require("current-color-scheme")

    require("lualine").setup({
      options = {
        theme = cs.lualine,
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
