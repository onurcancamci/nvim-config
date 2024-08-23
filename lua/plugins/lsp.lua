return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      local lspk = require("keymaps.lsp")
      local lsp = require("lspconfig")
      local cap = require("cmp_nvim_lsp").default_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = lspk.keymaps,
      })

      lsp.tsserver.setup({
        capabilities = cap,
        on_init = function(client)
          if
            client.server_capabilities ~= nil
            and client.server_capabilities.signatureHelpProvider
          then
            require("lsp-overloads").setup(client, {
              display_automatically = false,
            })
            -- client.server_capabilities.semanticTokensProvider = nil
            lspk.defineLspOverloads()
          end
        end,
      })
      lsp.sqlls.setup({
        capabilities = cap,
      })
      lsp.lua_ls.setup({
        capabilities = cap,
      })
      lsp.jsonls.setup({
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
        capabilities = cap,
      })
      lsp.yamlls.setup({
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
        capabilities = cap,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
}
