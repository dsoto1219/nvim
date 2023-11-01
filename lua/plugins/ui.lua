return {
    {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
	    transparent = true,
	    sidebars = { "qf", "terminal" },
	},
	config = function(_, opts)
	    require('tokyonight').setup(opts)
	    vim.cmd.colorscheme('tokyonight')
	end
    },
    {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {
	    options = {
		mode = "tabs",
	    }
	}
    },
    {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
	    "SmiteshP/nvim-navic",
	    "nvim-tree/nvim-web-devicons", -- optional dependency
	},
	    opts = { theme = 'tokyonight' },
    },
    {
	'nvim-lualine/lualine.nvim',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = { theme = "tokyonight" },
    },
}
