local dap = require('dap')

-- for javascript, typescript
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = {
      os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}"
    },
  }
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.typescript = dap.configurations.javascript


-- for c, c++, rust
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  -- you should install dap adapter by Mason, or download it yourself and put it in Mason dir
  command = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/OpenDebugAD7',
  options = {
    detached = false,  -- for what?
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    -- program = '${workspaceFolder}/a.out',  -- tmp config for test
    -- 这两个 input 出现的先后顺序竟然是随机的?
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function ()
      local args_string = vim.fn.input("Input arguments: ")
      return vim.split(args_string, " ")
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,  -- auto insert breakpoint for main if set true
    MIMode = 'gdb',
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description =  'enable pretty printing',
        ignoreFailures = false
      },
    },
  },
  -- enable it if needed
  -- {
  --   name = 'Attach to gdbserver :1234',
  --   type = 'cppdbg',
  --   request = 'launch',
  --   MIMode = 'gdb',
  --   miDebuggerServerAddress = 'localhost:1234',
  --   miDebuggerPath = '/usr/bin/gdb',
  --   cwd = '${workspaceFolder}',
  --   program = function()
  --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --   end,
  --   setupCommands = {
  --     {
  --       text = '-enable-pretty-printing',
  --       description =  'enable pretty printing',
  --       ignoreFailures = false
  --     },
  --   },
  -- },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


-- for bash
dap.adapters.bashdb = {
  type = 'executable';
  command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
  name = 'bashdb';
}

dap.configurations.sh = {
  {
    type = 'bashdb';
    request = 'launch';
    name = "Launch file";
    showDebugOutput = true;
    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
    trace = true;
    file = "${file}";
    program = "${file}";
    cwd = '${workspaceFolder}';
    pathCat = "cat";
    pathBash = "/bin/bash";
    pathMkfifo = "mkfifo";
    pathPkill = "pkill";
    args = {};
    env = {};
    terminalKind = "integrated";
  }
}


local dap_breakpoint_color_dark = {
  breakpoint = {
    ctermbg = 0,
    bg = '#372423',
  },
  breakpoint_icon = {
    ctermbg = 0,
    fg = '#b95b54',
  },
  logpoint = {
    ctermbg = 0,
    bg = '#372423',
  },
  stopped = {
    ctermbg = 0,
    bg = '#396095',
    -- fg = '#ffffff'
  },
  stopped_icon = {
    ctermbg = 0,
    fg = '#e6a94c',
  },
}

local dap_breakpoint_color_light = {
  breakpoint = {
    ctermbg = 0,
    bg = '#f7eae7',
  },
  breakpoint_icon = {
    ctermbg = 0,
    fg = '#cc6063',
  },
  logpoint = {
    ctermbg = 0,
    bg = '#f7eae7',
  },
  stopped = {
    ctermbg = 0,
    bg = '#2d55a0',
    fg = '#ffffff'
  },
  stopped_icon = {
    ctermbg = 0,
    fg = '#e2a439',
  },
}

local dap_breakpoint_color = nil

if vim.o.background == 'dark' then
  dap_breakpoint_color = dap_breakpoint_color_dark
else
  dap_breakpoint_color = dap_breakpoint_color_light
end

vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, 'DapBreakpointIcon', dap_breakpoint_color.breakpoint_icon)
vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoint)
vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)
vim.api.nvim_set_hl(0, 'DapStoppedIcon', dap_breakpoint_color.stopped_icon)

local dap_breakpoint = {
  error = {
    text = '',
    texthl = 'DapBreakpointIcon',
    linehl = 'DapBreakpoint',
  },
  condition = {
    text = '',
    texthl = 'DapBreakpointIcon',
    linehl = 'DapBreakpoint',
  },
  rejected = {
    text = "",
    texthl = 'DapBreakpintIcon',
    linehl = 'DapBreakpoint',
  },
  logpoint = {
    text = '',
    texthl = 'DapLogPointIcon',
    linehl = 'DapLogPoint',
  },
  stopped = {
    text = '',
    texthl = 'DapStoppedIcon',
    linehl = 'DapStopped',
  },
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

-- dap-virtual-text
require("nvim-dap-virtual-text").setup()

-- integrated terminal get focus when its created, no work?
dap.defaults.fallback.focus_terminal = true

