return {
  {
    'dracula/vim',
    lazy = false,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme dracula]])
    end,
  },
  { "j-hui/fidget.nvim" },
  { "github/copilot.vim"}
}
