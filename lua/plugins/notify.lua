return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "static",
        fps = 1,
      })
      vim.notify = notify
    end,
  },
}
