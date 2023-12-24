local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "folke/neodev.nvim",
    ft = { "lua" },
    config = function ()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end
  },

  -- show complete count of searching matches instead of "> 99"
  {
    "google/vim-searchindex",
    lazy = false,
  },

  -- highlights for justfile, see https://github.com/casey/just
  {
    "NoahTheDuke/vim-just",
    ft = { "just" },
  },

  -- Plugins for debugging
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require("custom.configs.dap")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require "custom.configs.dap-ui"
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function ()
      require("telescope").load_extension("dap")
    end,
  },

  -- Plugins for markdown
  -- Preview markdown on browser
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function ()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- Paste image in markdown files
  {
    "img-paste-devs/img-paste.vim",
    ft = "markdown",
  },
  -- Simple keymaps for markdown
  {
    "antonk52/markdowny.nvim",
    ft = "markdown",
    config = function()
      require('markdowny').setup()
    end
  },
  -- Basic markdown
  {
    "preservim/vim-markdown",
    -- ft = "markdown",  -- maybe uncomment later
  },

  -- plugin for translation
  {
    "voldikss/vim-translator",
    lazy = false,
  },

  {
    "nvim-treesitter/playground",
  },
  {
    "majutsushi/tagbar",
    lazy = false,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function ()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {
      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          -- disable autopair for ` for dap-repl filetype
          disable_filetype = { "TelescopePrompt", "vim", "dap-repl" },
        }
      }
    }
  },
  -- enable auto-completion for dap-repl
  {
    "rcarriga/cmp-dap",
    event = "InsertEnter",
    config = function()
      require("cmp").setup({
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
              or require("cmp_dap").is_dap_buffer()
        end
      })

      require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" },
        },
      })
    end
  },

  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = {
      lsp = { auto_attach = true },
      window = {
        size = "90%",
        sections = {
          left = {
            size = "15%",
          },
          mid = {
            size = "25%"
          },
        }
      }
    }
  },

  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      -- -- format & linting
      -- {
      --   "jose-elias-alvarez/null-ls.nvim",
      --   config = function()
      --     require "custom.configs.null-ls"
      --   end,
      -- },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
