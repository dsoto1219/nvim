return {
  -- misc plugins
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
  },
  { "https://github.com/neovimhaskell/haskell-vim" },
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  -- "sevko/vim-nand2tetris-syntax",
}
