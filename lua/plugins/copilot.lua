return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    enabled = false,
    config = function()
      local copilot = require("copilot")
      copilot.setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<C-y>",
            accept_word = false,
            accept_line = false,
            -- next = "<M-]>",
            -- prev = "<M-[>",
            dismiss = "<C-c>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },
}
