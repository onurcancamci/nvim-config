return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "html",
          "bash",
          "cmake",
          "cpp",
          "css",
          "csv",
          "dockerfile",
          "gdscript",
          "gdshader",
          "gitignore",
          "go",
          "java",
          "json",
          "jsdoc",
          "markdown",
          "markdown_inline",
          "nginx",
          "python",
          "rust",
          "scss",
          "sql",
          "ssh_config",
          "tmux",
          "toml",
          "tsx",
          "typescript",
          "typespec",
          "xml",
          "yaml",
        },
        sync_install = false,
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- you can change this if you want.
            goto_next_start = {
              ["]b"] = { query = "@code_cell.inner", desc = "next code block" },
              ["]f"] = {
                query = "@function.outer",
                desc = "next function",
              },
            },
            -- goto_previous_start = {
            --   ["[b"] = {
            --     query = "@code_cell.inner",
            --     desc = "previous code block",
            --   },
            --   ["[f"] = {
            --     query = "@function.outer",
            --     desc = "previous function",
            --   },
            -- },
          },
          select = {
            enable = true,
            lookahead = true, -- you can change this if you want
            keymaps = {
              --- ... other keymaps
              -- ["ib"] = { query = "@code_cell.inner", desc = "in block" },
              -- ["ab"] = { query = "@code_cell.outer", desc = "around block" },
              ["if"] = {
                query = "@function.inner",
                desc = "in function",
              },
              ["af"] = {
                query = "@function.outer",
                desc = "around function",
              },
            },
          },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- init = function() end,
  },
}
