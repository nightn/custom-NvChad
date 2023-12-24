local dap = require("dap")
local dapui = require("dapui")

local config = {
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = "",
    },
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "",
    expanded = "",
  },
  layouts = {
    -- shut it up
    -- {
    --   elements = {
    --     {
    --       id = "scopes",
    --       size = 0.25,
    --     },
    --     {
    --       id = "breakpoints",
    --       size = 0.25,
    --     },
    --     {
    --       id = "stacks",
    --       size = 0.25,
    --     },
    --     {
    --       id = "watches",
    --       size = 0.25,
    --     },
    --   },
    --   position = "right",
    --   size = 40,
    -- },
    {
      elements = {
        {
          id = "repl",
          size = 0.7,
        },
        {
          id = "console",
          size = 0.3,
        },
      },
      position = "bottom",
      size = 12,
    },
  },
  mappings = {
    -- 'e' is conflict with vim shortcuts, so I use 'E' here
    edit = "E",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t",
  },
  render = {
    indent = 1,
    max_value_lines = 100,
  },
}

-- dap-ui events
dapui.setup(config)
-- uncomment it if you want dap-ui auto open
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

