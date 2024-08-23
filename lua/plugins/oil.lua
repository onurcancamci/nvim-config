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
              ["hook.ts"] = { hl = "MiniIconsPurple" },
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
          signcolumn = "yes:2",
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
    "SirZenith/oil-vcs-status",
    config = function()
      local status_const = require("oil-vcs-status.constant.status")
      local vcs_hl = require("current-color-scheme").vcs_hl_groups

      local StatusType = status_const.StatusType

      require("oil-vcs-status").setup({
        -- Executable path of each version control system.
        vcs_executable = {
          git = "git",
        },

        -- If trigger time between two file system event of the same entry is less
        -- than this value, newer event will be ignored, unit: milisecond.
        ---@type integer
        fs_event_debounce = 500,

        -- Sign character used by each status.
        status_symbol = {
          [StatusType.Added] = "A",
          [StatusType.Copied] = "C",
          [StatusType.Deleted] = "D",
          [StatusType.Ignored] = "!",
          [StatusType.Modified] = "M",
          [StatusType.Renamed] = "R",
          [StatusType.TypeChanged] = "T",
          [StatusType.Unmodified] = " ",
          [StatusType.Unmerged] = "U",
          [StatusType.Untracked] = "?",
          [StatusType.External] = "X",

          [StatusType.UpstreamAdded] = "A",
          [StatusType.UpstreamCopied] = "C",
          [StatusType.UpstreamDeleted] = "D",
          [StatusType.UpstreamIgnored] = "!",
          [StatusType.UpstreamModified] = "M",
          [StatusType.UpstreamRenamed] = "R",
          [StatusType.UpstreamTypeChanged] = "T",
          [StatusType.UpstreamUnmodified] = " ",
          [StatusType.UpstreamUnmerged] = "U",
          [StatusType.UpstreamUntracked] = "?",
          [StatusType.UpstreamExternal] = "X",
        },

        -- Highlight group name used by each status type.

        status_hl_group = {
          [StatusType.Added] = vcs_hl.added,
          [StatusType.Copied] = vcs_hl.modified,
          [StatusType.Deleted] = vcs_hl.deleted,
          [StatusType.Ignored] = vcs_hl.ignored,
          [StatusType.Modified] = vcs_hl.modified,
          [StatusType.Renamed] = vcs_hl.modified,
          [StatusType.TypeChanged] = vcs_hl.modified,
          [StatusType.Unmodified] = vcs_hl.ignored,
          [StatusType.Unmerged] = vcs_hl.modified,
          [StatusType.Untracked] = vcs_hl.untracked,
          [StatusType.External] = vcs_hl.ignored,

          [StatusType.UpstreamAdded] = vcs_hl.added,
          [StatusType.UpstreamCopied] = vcs_hl.modified,
          [StatusType.UpstreamDeleted] = vcs_hl.deleted,
          [StatusType.UpstreamIgnored] = vcs_hl.ignored,
          [StatusType.UpstreamModified] = vcs_hl.modified,
          [StatusType.UpstreamRenamed] = vcs_hl.modified,
          [StatusType.UpstreamTypeChanged] = vcs_hl.modified,
          [StatusType.UpstreamUnmodified] = vcs_hl.ignored,
          [StatusType.UpstreamUnmerged] = vcs_hl.modified,
          [StatusType.UpstreamUntracked] = vcs_hl.untracked,
          [StatusType.UpstreamExternal] = vcs_hl.ignored,
        },

        status_priority = {
          [StatusType.UpstreamIgnored] = 10,
          [StatusType.Ignored] = 10,

          [StatusType.UpstreamUntracked] = 11,
          [StatusType.Untracked] = 11,

          [StatusType.UpstreamUnmodified] = 12,
          [StatusType.Unmodified] = 12,
          [StatusType.UpstreamExternal] = 12,
          [StatusType.External] = 12,

          [StatusType.UpstreamCopied] = 13,
          [StatusType.UpstreamRenamed] = 13,
          [StatusType.UpstreamTypeChanged] = 13,

          [StatusType.UpstreamDeleted] = 14,
          [StatusType.UpstreamModified] = 14,
          [StatusType.UpstreamAdded] = 14,

          [StatusType.UpstreamUnmerged] = 15,

          [StatusType.Copied] = 113,
          [StatusType.Renamed] = 113,
          [StatusType.TypeChanged] = 113,

          [StatusType.Deleted] = 114,
          [StatusType.Modified] = 114,
          [StatusType.Added] = 114,

          [StatusType.Unmerged] = 115,
        },

        vcs_specific = {
          git = {
            status_update_debounce = 200,
          },
        },
      })
    end,
  },
}
