local M = {}

M.keymaps = {
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
  },
  {
    "<leader>dC",
    function()
      require("dap").clear_breakpoints()
    end,
    desc = "Clear Breakpoints",
  },
  {
    "<leader>dl",
    function()
      require("dap").list_breakpoints()
    end,
    desc = "List Breakpoints",
  },
  {
    "<leader>do",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
  },
  {
    "<leader>dI",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
  },
  {
    "<leader>da",
    function()
      if vim.fn.filereadable(".vscode/launch.json") then
        local dap_vscode = require("dap.ext.vscode")
        dap_vscode.load_launchjs(nil, {})
      end
      require("dap").continue()
    end,
  },
}

return M
