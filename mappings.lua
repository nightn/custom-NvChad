---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    -- ["[b"] = { "<cmd> bp <CR>", "Previouse buffer" },
    -- ["]b"] = { "<cmd> bn <CR>", "Next buffer" },
    ["H"] = { "<cmd> bp <CR>", "Previouse buffer" },
    ["L"] = { "<cmd> bn <CR>", "Next buffer" },
    ["<leader>q"] = {
      "<cmd> cclose | lclose | pclose | helpclose <CR>",
      "Close all kinds of windows",
      opts = { noremap = true }
    },
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
    ["<leader>a"] = {
      "<cmd> TSHighlightCapturesUnderCursor <CR>",
      "TSHighlightCapturesUnderCursor"
    },
    ["<leader>nv"] = { "<cmd> Navbuddy <CR>", "Navbuddy" },
  },
  t = {
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
    ["<C-w><C-w>"] = {
      "<C-\\><C-n><C-w><C-w>",
      "Switch window in terminal mode",
      opts = { noremap = true }
    },
    -- switch between windows
    ["<C-h>"] = { "<C-\\><C-n><C-w>h", "Window left" },
    ["<C-l>"] = { "<C-\\><C-n><C-w>l", "Window right" },
    ["<C-j>"] = { "<C-\\><C-n><C-w>j", "Window down" },
    ["<C-k>"] = { "<C-\\><C-n><C-w>k", "Window up" },
  },
  v = {
    ["<C-c>"] = { '"+y', "Copy to system clipboard", opts = { noremap = true }},
  }
}

M.disabled = {
  n = {
    ["gd"] = "",
    -- ["gr"] = "",
    ["<leader>ra"] = "",
    ["<leader>b"] = "",
    ["<leader>ph"] = "",
    ["<leader>rh"] = "",
    -- term
    ["<leader>h"] = "",
    -- buffer
    ["<tab>"] = "",  -- [important] unmap <tab> to avoid <C-I> jump list bug
    ["<S-tab>"] = "",
  }
}

M.lspconfig = {
  n = {
    -- When there are multiple definitions, the following function use quickfix, that's not so good
    -- ["<leader>gt"] = {
    --   function()
    --     vim.lsp.buf.definition()
    --   end,
    --   "LSP definition",
    -- },
    ["<leader>rn"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "LSP rename",
    },
    ["<leader>fi"] = {
      function()
        vim.lsp.buf.code_action({ apply = true })
      end,
      "LSP fix current",
    },

  }
}

M.telescope = {
  n = {
    ["<leader>gr"] = {
      function ()
        require('telescope.builtin').lsp_references()
      end,
      "Telescope lsp_references"
    },
    ["<leader>gt"] = { "<cmd> Telescope lsp_definitions <CR>", "Goto definitions" },
    ["<leader>fw"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "Find symbols in workspace" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>dd"] = { "<cmd> Telescope diagnostics <CR>", "Show diagnostics" },
    ["<C-p>"] = { "<cmd> Telescope keymaps <CR>", "Telescope keymaps"},
  }
}

M.gitsigns = {
  n = {
    -- Actions
    ["<leader>hu"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Hunk undo",
    },

    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Hunk preview",
    },
  }
}

-- We use NvChad default kemap (<leader>/) to toggle comment, the following config will be removed
-- M.comment = {
--   -- toggle comment in both modes
--   n = {
--     ["<leader>cb"] = {
--       function()
--         require("Comment.api").toggle.linewise.current()
--       end,
--       "Toggle comment",
--     },
--     ["<leader>cu"] = {
--       function()
--         require("Comment.api").toggle.linewise.current()
--       end,
--       "Toggle comment",
--     },
--   },
--
--   v = {
--     ["<leader>cb"] = {
--       "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--       "Toggle comment",
--     },
--     ["<leader>cu"] = {
--       "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--       "Toggle comment",
--     },
--   },
-- }

M.debugger = {
  n = {
    ["<leader>dc"] = { "<cmd> DapContinue <CR>", "DapContinue (continue)" },
    ["<leader>dt"] = { "<cmd> DapTerminate <CR>", "DapTerminate (terminate)" },
    ["<leader>dn"] = { "<cmd> DapStepOver <CR>", "DapStepOver (next)" },
    ["<leader>ds"] = { "<cmd> DapStepInto <CR>", "DapStepInto (step)" },
    ["<leader>df"] = { "<cmd> DapStepOut <CR>", "DapStepOut (finish)" },
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "DapToggleBreakpoint (breakpoint)" },
    ["<leader>dk"] = {
      function ()
        require("dapui").eval()
      end,
      "dapui evaluate expression"
    },
    ["<leader>du"] = {
      function ()
        require("dapui").toggle()
      end,
      "dapui toggle"
    },
  },
  v = {
    ["<leader>dk"] = {
      function ()
        require("dapui").eval()
      end,
      "dapui evaluate expression"
    }
  }
}

-- more keybinds!
M.markdown = {
  n = {
    ["<leader>mp"] = { "<cmd>MarkdownPreview <CR>", "MarkdownPreview"},
  },
}

return M
