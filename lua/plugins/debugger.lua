return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap = require("dap")
    vim.keymap.set("n", "<F5>", function()
      dap.continue()
    end)
  end,
}
