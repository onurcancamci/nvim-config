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
          [StatusType.Added] = "OilVcsStatusAdded",
          [StatusType.Copied] = "OilVcsStatusCopied",
          [StatusType.Deleted] = "OilVcsStatusDeleted",
          [StatusType.Ignored] = "OilVcsStatusIgnored",
          [StatusType.Modified] = "OilVcsStatusModified",
          [StatusType.Renamed] = "OilVcsStatusRenamed",
          [StatusType.TypeChanged] = "OilVcsStatusTypeChanged",
          [StatusType.Unmodified] = "OilVcsStatusUnmodified",
          [StatusType.Unmerged] = "OilVcsStatusUnmerged",
          [StatusType.Untracked] = "OilVcsStatusUntracked",
          [StatusType.External] = "OilVcsStatusExternal",

          [StatusType.UpstreamAdded] = "OilVcsStatusUpstreamAdded",
          [StatusType.UpstreamCopied] = "OilVcsStatusUpstreamCopied",
          [StatusType.UpstreamDeleted] = "OilVcsStatusUpstreamDeleted",
          [StatusType.UpstreamIgnored] = "OilVcsStatusUpstreamIgnored",
          [StatusType.UpstreamModified] = "OilVcsStatusUpstreamModified",
          [StatusType.UpstreamRenamed] = "OilVcsStatusUpstreamRenamed",
          [StatusType.UpstreamTypeChanged] = "OilVcsStatusUpstreamTypeChanged",
          [StatusType.UpstreamUnmodified] = "OilVcsStatusUpstreamUnmodified",
          [StatusType.UpstreamUnmerged] = "OilVcsStatusUpstreamUnmerged",
          [StatusType.UpstreamUntracked] = "OilVcsStatusUpstreamUntracked",
          [StatusType.UpstreamExternal] = "OilVcsStatusUpstreamExternal",
        },

        -- Sign priority of each staus. When sign column width is less then staus
        -- symbol number, symbol with higher priority will be shown.
        -- If signcolumn is wide enough, signs will be display from left to right in
        -- order of priority from low to high.
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
            -- `git status` command triggers file system event when it finished.
            -- Plugin will ignore file system event in this amount of time, after
            -- `git status` finishes its executation. Unit: milisecond.
            ---@type integer
            status_update_debounce = 200,
          },
        },
      })

      vim.cmd("highlight! link OilVcsStatusAdded DiagnosticSignHint")
      vim.cmd("highlight! link OilVcsStatusCopied DiagnosticSignWarn")
      vim.cmd("highlight! link OilVcsStatusDeleted DiagnosticSignError")
      vim.cmd("highlight! link OilVcsStatusIgnored @comment")
      vim.cmd("highlight! link OilVcsStatusModified DiagnosticSignWarn")
      vim.cmd("highlight! link OilVcsStatusRenamed @function")
      vim.cmd("highlight! link OilVcsStatusTypeChanged @function")
      vim.cmd("highlight! link OilVcsStatusUnmodified @comment")
      vim.cmd("highlight! link OilVcsStatusUnmerged @character")
      vim.cmd("highlight! link OilVcsStatusUntracked @keyword")
      vim.cmd("highlight! link OilVcsStatusExternal @comment")

      vim.cmd("highlight! link OilVcsStatusUpstreamAdded DiagnosticSignHint")
      vim.cmd("highlight! link OilVcsStatusUpstreamCopied DiagnosticSignWarn")
      vim.cmd("highlight! link OilVcsStatusUpstreamDeleted DiagnosticSignError")
      vim.cmd("highlight! link OilVcsStatusUpstreamIgnored @comment")
      vim.cmd("highlight! link OilVcsStatusUpstreamModified DiagnosticSignWarn")
      vim.cmd("highlight! link OilVcsStatusUpstreamRenamed @function")
      vim.cmd("highlight! link OilVcsStatusUpstreamTypeChanged @function")
      vim.cmd("highlight! link OilVcsStatusUpstreamUnmodified @comment")
      vim.cmd("highlight! link OilVcsStatusUpstreamUnmerged @character")
      vim.cmd("highlight! link OilVcsStatusUpstreamUntracked @keyword")
      vim.cmd("highlight! link OilVcsStatusUpstreamExternal @comment")
    end,
  },
}
