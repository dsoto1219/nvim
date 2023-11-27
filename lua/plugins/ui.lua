return {
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local onedark = require('onedark')
      onedark.setup{
          style = "warmer"
      }
      onedark.load()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {}
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = { theme = 'onedark' },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { theme = "onedark" },
  },
}
