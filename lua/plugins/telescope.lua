---@type any
local bcmd =
  "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
local env = require("env-config")

if env.use_binary_extensions == false then
  bcmd = false
end

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
    config = function()
      local Path = require("plenary.path")
      local function normalize_path(buf_name, root)
        return Path:new(buf_name):make_relative(root)
      end
      local get_root_dir = function()
        return vim.loop.cwd()
      end

      local function make_harpoon_list_item(name)
        name = name
          or normalize_path(
            vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
            get_root_dir()
          )

        local bufnr = vim.fn.bufnr(name, false)

        local pos = { 1, 0 }
        if bufnr ~= -1 then
          pos = vim.api.nvim_win_get_cursor(0)
        end

        return {
          value = name,
          context = {
            row = pos[1],
            col = pos[2],
          },
        }
      end

      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
            find_cmd = "rg",
          },
        },
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "**/*.bak",
            "**/*-lock.json",
            "**/*-lock.yaml",
            "save.vim",
            "dist",
            "**/*.js.map",
            "**/*.ts.map",
            "bin/cli",
            ".git/",
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--ignore-file",
            ".gitignore",
          },
          mappings = {
            i = {
              ["<C-h>"] = "which_key",
              ["<c-d>"] = function(arg)
                vim.api.nvim_command("wall")
                require("telescope.actions").delete_buffer(arg)
              end,
              ["<C-S-d>"] = function(arg)
                require("telescope.actions").delete_buffer(arg)
              end,
              ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
              ["<C-k>"] = require("telescope.actions").preview_scrolling_up,

              ["<C-e>"] = function(arg1)
                local selection =
                  require("telescope.actions.state").get_selected_entry()
                local harpoon = require("harpoon")
                local fname = vim.fn.fnamemodify(selection.path, ":.")
                local item = make_harpoon_list_item(fname)
                local _, idx = harpoon:list():get_by_value(item.value)

                if idx == nil then
                  harpoon:list():add(item)
                  print("Added")
                else
                  harpoon:list():remove(item)
                  print("Removed")
                end
              end,
              ["<C-v>"] = require("telescope.actions").send_selected_to_qflist,
            },

            n = {
              ["<c-d>"] = function(arg)
                vim.api.nvim_command("wall")
                require("telescope.actions").delete_buffer(arg)
              end,
              ["<C-S-d>"] = function(arg)
                require("telescope.actions").delete_buffer(arg)
              end,
              ["<C-e>"] = function(arg1)
                local selection =
                  require("telescope.actions.state").get_selected_entry()
                local harpoon = require("harpoon")
                local fname = vim.fn.fnamemodify(selection.path, ":.")
                local item = make_harpoon_list_item(fname)
                local _, idx = harpoon:list():get_by_value(item.value)

                if idx == nil then
                  harpoon:list():add(item)
                  print("Added")
                else
                  harpoon:list():remove(item)
                  print("Removed")
                end
              end,
              ["<C-v>"] = require("telescope.actions").send_selected_to_qflist,
            },
          },
        },
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("dir")
      -- require("telescope").load_extension("media_files")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = bcmd,
  },
  {
    "princejoogie/dir-telescope.nvim",
    priority = 10,
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  },
  -- {
  --   "nvim-telescope/telescope-media-files.nvim",
  -- },
}
