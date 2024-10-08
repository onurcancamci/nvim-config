return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "MattiasMTS/cmp-dbee",
        dependencies = {
          { "kndndrj/nvim-dbee" },
        },
        ft = "sql", -- optional but good to have
        opts = {}, -- needed
      },
      { "Issafalcon/lsp-overloads.nvim" },
    },
    config = function()
      local cmp = require("cmp")
      local my_cs = require("current-color-scheme")

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        sources = {
          { name = "nvim_lsp", max_item_count = 100 },
          -- { "cmp-dbee" },
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
            vim.snippet.stop()
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-f>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),

          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),

          -- ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-Space>"] = cmp.mapping({
            i = function()
              if cmp.visible() then
                cmp.abort()
              else
                cmp.complete()
              end
            end,
            c = function()
              if cmp.visible() then
                cmp.close()
              else
                cmp.complete()
              end
            end,
          }),
          -- ["<C-e>"] = cmp.mapping.abort(),
        }),
        window = {
          -- completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        enabled = function()
          local context = require("cmp.config.context")

          if vim.bo.filetype == "TelescopePrompt" then
            return false
          end
          if vim.api.nvim_get_mode().mode == "c" then
            return true
          else
            return not context.in_treesitter_capture("comment")
              and not context.in_syntax_group("Comment")
              and not context.in_treesitter_capture("string")
              and not context.in_syntax_group("string")
          end
        end,
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local function get_lsp_completion_context(completion, source)
              local ok, source_name = pcall(function()
                return source.source.client.config.name
              end)
              if not ok then
                return nil
              end
              if source_name == "tsserver" then
                return completion.detail
              elseif source_name == "pyright" or source_name == "vtsls" then
                if completion.labelDetails ~= nil then
                  return completion.labelDetails.description
                end
              elseif source_name == "gopls" then
                return completion.detail
              end
            end

            vim_item.kind = string.format("%s", my_cs.kind_icons[vim_item.kind]) -- This concatenates the icons with the name of the item kind

            local source_names = {
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              latex_symbols = "[LaTeX]",
              calc = "[Calc]",
            }

            -- Assign a default source name if not already set
            vim_item.menu = source_names[entry.source.name] or entry.source.name

            local completion_context =
              get_lsp_completion_context(entry.completion_item, entry.source)
            if completion_context ~= nil and completion_context ~= "" then
              vim_item.menu = completion_context
            end

            return vim_item
          end,
        },
      })
      cmp.setup.filetype({ "sql" }, {
        sources = {
          -- { name = "vim-dadbod-completion" },
          { name = "nvim_lsp" },
          { name = "cmp-dbee" },
          { name = "buffer" },
        },
      })
    end,
  },
}
