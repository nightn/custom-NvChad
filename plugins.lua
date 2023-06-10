local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

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

  {
    "nvim-treesitter/playground",
    lazy = false,
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
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } }
      }
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
