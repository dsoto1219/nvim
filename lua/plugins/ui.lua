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
