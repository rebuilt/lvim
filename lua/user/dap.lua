local M = {}

M.setup = function()
  lvim.builtin.dap.active = true
  -- ruby debugging support
  require("dapui").setup()
  require("dap-ruby").setup()
  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

return M
