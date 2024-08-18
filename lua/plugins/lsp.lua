return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    config = function()
      local lsp = require("lsp-zero")
      local lspk = require("keymaps.lsp")

      lsp.extend_lspconfig({
        sign_text = true,
        lsp_attach = lspk.keymaps,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  }, --
  { "neovim/nvim-lspconfig" }, --
  { "hrsh7th/cmp-nvim-lsp" }, --
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    priority = 10,
    config = function()
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

          tsserver = function()
            require("lspconfig").tsserver.setup({})
          end,

          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = { Lua = { diagnostics = { globals = { "vim" } } } },
            })
          end,

          jsonls = function()
            require("lspconfig").jsonls.setup({
              filetypes = { "json", "jsonc" },
              settings = {
                json = {
                  -- Schemas https://www.schemastore.org
                  schemas = {
                    {
                      fileMatch = { "package.json" },
                      url = "https://json.schemastore.org/package.json",
                    },
                    {
                      fileMatch = { "tsconfig*.json" },
                      url = "https://json.schemastore.org/tsconfig.json",
                    },
                    {
                      fileMatch = {
                        ".prettierrc",
                        ".prettierrc.json",
                        "prettier.config.json",
                      },
                      url = "https://json.schemastore.org/prettierrc.json",
                    },
                    {
                      fileMatch = { ".eslintrc", ".eslintrc.json" },
                      url = "https://json.schemastore.org/eslintrc.json",
                    },
                    {
                      fileMatch = {
                        ".babelrc",
                        ".babelrc.json",
                        "babel.config.json",
                      },
                      url = "https://json.schemastore.org/babelrc.json",
                    },
                    {
                      fileMatch = { "lerna.json" },
                      url = "https://json.schemastore.org/lerna.json",
                    },
                    {
                      fileMatch = { "now.json", "vercel.json" },
                      url = "https://json.schemastore.org/now.json",
                    },
                    {
                      fileMatch = {
                        ".stylelintrc",
                        ".stylelintrc.json",
                        "stylelint.config.json",
                      },
                      url = "http://json.schemastore.org/stylelintrc.json",
                    },
                  },
                },
              },
            })
          end,
          yamlls = function()
            require("lspconfig").yamlls.setup({
              settings = {
                yaml = {
                  -- Schemas https://www.schemastore.org
                  schemas = {
                    ["http://json.schemastore.org/gitlab-ci.json"] = {
                      ".gitlab-ci.yml",
                    },
                    ["https://json.schemastore.org/bamboo-spec.json"] = {
                      "bamboo-specs/*.{yml,yaml}",
                    },
                    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                      "docker-compose*.{yml,yaml}",
                    },
                    ["http://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
                    ["http://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
                    ["http://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yml,yaml}",
                    ["http://json.schemastore.org/stylelintrc.json"] = ".stylelintrc.{yml,yaml}",
                    ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}
