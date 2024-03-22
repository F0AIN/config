return {
  -- color scheme
  {
    'dracula/vim',
    lazy = false,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme dracula]])
    end,
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    config = function() require('extensions.telescope') end,
    dependencies = { 
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require'nvim-web-devicons'.setup {
        default = true;
      }
    end
  }, 

  -- UI
  { 
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        text = { spinner = 'meter' },
      })
    end,
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  {
    "rebelot/heirline.nvim",
    config = function()
      require("extensions.heirline")
    end,
  },
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require'alpha'.setup(require'alpha.themes.theta'.config)
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar').setup()
      require('scrollbar.handlers.search').setup()
    end,
    dependencies = {
      'kevinhwang91/nvim-hlslens',
    },
  },

  -- utility
  { "github/copilot.vim"},
  { "subnut/nvim-ghost.nvim"},

  -- 色表示
  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup()
    end,
  },

  -- discord
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup({})
    end,
  },

  -- bar
  {
    "romgrk/barbar.nvim",
  },
}
