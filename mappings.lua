---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["[b"] = { "<cmd> bp <CR>", "Previouse buffer" },
    ["]b"] = { "<cmd> bn <CR>", "Next buffer" },
    ["<leader>q"] = {
      "<cmd> cclose | lclose | pclose | helpclose <CR>",
      "Close all kinds of windows",
      opts = { noremap = true }
    },
    ["<C-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
    ["<leader>a"] = {
      "<cmd> TSHighlightCapturesUnderCursor <CR>",
      "TSHighlightCapturesUnderCursor"
    },
  },
  t = {
    ["<C-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
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
  }
}

M.lspconfig = {
  n = {
    ["<leader>gt"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },
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
    ["<leader>fw"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "Find symbols in workspace" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>d"] = { "<cmd> Telescope diagnostics <CR>", "Show diagnostics" },
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

M.comment = {
  -- toggle comment in both modes
  n = {
    ["<leader>cb"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>cb"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

-- more keybinds!

return M
