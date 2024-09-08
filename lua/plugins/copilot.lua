local env = require("env-config")

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    enabled = env.use_binary_extensions,
    config = function()
      local copilot = require("copilot")
      copilot.setup({
        suggestion = {
          enabled = true,
          auto_trigger = false,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<C-y>",
            accept_word = false,
            accept_line = false,
            next = "<C-u>",
            -- prev = "<C-S-i>",
            dismiss = "<C-c>",
          },
        },
        panel = { enabled = false },
      })

      vim.g.is_copilot_enabled = true

      function _G.toggle_copilot()
        if vim.g.is_copilot_enabled then
          vim.g.is_copilot_enabled = false
          vim.cmd("Copilot disable")
          print("Copilot is disabled")
        else
          vim.g.is_copilot_enabled = true
          vim.cmd("Copilot enable")
          print("Copilot is enabled")
        end
      end

      -- asd

      vim.keymap.set(
        "n",
        "<leader>hc",
        "<cmd>call v:lua.toggle_copilot()<CR>",
        { silent = true, noremap = true }
      )
    end,
  },
}
