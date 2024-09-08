local env = require("env-config")

return {
  {
    "rcarriga/nvim-dap-ui",
    enabled = env.use_binary_extensions,
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "mfussenegger/nvim-dap",
    enabled = env.use_binary_extensions,
    config = function() end,
    keys = require("keymaps.dap").keymaps,
    dependencies = {
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
        version = "1.*",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          -- port bun icin 6499
          -- node icin 9229
          require("dap-vscode-js").setup({
            debugger_path = vim.fn.resolve(
              vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"
            ),
            adapters = {
              "chrome",
              "node",
              "pwa-node",
              "pwa-chrome",
              "pwa-msedge",
              "pwa-extensionHost",
              "node-terminal",
            },
          })

          require("dap").configurations.typescript = {
            {
              type = "pwa-node",
              name = "Attach to Process",
              request = "attach",
              port = 9229,
              -- sourceMaps = true,
              -- restart = true,
              skipFiles = { "<node_internals>/**" },
              -- localRoot = "${workspaceFolder}/src",
              -- remoteRoot = "${workspaceFolder}/dist/esm",
              -- outFiles = { "${workspaceFolder}/dist/esm/**/*.js" },
              cwd = "${workspaceFolder}",
            },
            -- {
            --   type = "pwa-node",
            --   request = "launch",
            --   name = "Launch Node",
            --   sourceMaps = true,
            --   propgram = "${workspaceFolder}/src/Test/index.ts",
            --   preLaunchTask = "npm: build",
            --   outFiles = { "${workspaceFolder}/dist/esm/**/*.js" },
            -- },
            -- {
            --   name = "Run dev:node",
            --   type = "pwa-node",
            --   runtimeArgs = { "run-script", "dev:node" },
            --   runtimeExecutable = "pnpm",
            --   skipFiles = { "<node_internals>/**" },
            --   request = "launch",
            -- },
            -- {
            --   type = "pwa-node",
            --   request = "attach",
            --   name = "Pick Process",
            --   processId = require("dap.utils").pick_process,
            --   cwd = vim.fn.getcwd(),
            --   sourceMaps = true,
            -- },
            -- {
            --   type = "pwa-node",
            --   request = "launch",
            --   name = "Launch file",
            --   program = "${file}",
            --   cwd = vim.fn.getcwd(),
            --   sourceMaps = true,
            -- },
          }
        end,
      },
    },
  },
}
