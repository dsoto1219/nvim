-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- misc plugins
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"sevko/vim-nand2tetris-syntax",
	"nathom/filetype.nvim",

	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		opts = { transparent = true },
		config = function(_, opts)
			require('onedark').setup(opts)
			vim.cmd.colorscheme("onedark")
		end
	},
	"lervag/vimtex",
	{
		"iurimateus/luasnip-latex-snippets.nvim",
		-- vimtex isn't required if using treesitter
		dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
		opts = { usetreesitter = true },
		config = function(_, opts)
			require'luasnip-latex-snippets'.setup(opts)
		end,
	},
	{
	  'akinsho/toggleterm.nvim',
	  version = "*",
	  config = true
	},
	{ 'dccsillag/magma-nvim', build = ':UpdateRemotePlugins' },
	{"nvim-tree/nvim-web-devicons"},
	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  lazy = false,
	  dependencies = {
		"nvim-tree/nvim-web-devicons",
	  },
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function(_, opts)
			require('bufferline').setup(opts)
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {"nvim-tree/nvim-web-devicons"},
		opts = { theme = "onedark" },
		config = function(_, opts)
			require('lualine').setup(opts)
		end
	},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"nvim-treesitter/playground"},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		  dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	  end,
	},
	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{'williamboman/mason.nvim'},           -- Optional
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'saadparwaiz1/cmp_luasnip'}, -- Required if you want luasnip
		{'hrsh7th/cmp-buffer'}, -- Optional
		{'hrsh7th/cmp-path'}, -- Optional
		{'hrsh7th/cmp-cmdline'}, -- Optional
		{'hrsh7th/nvim-cmp'}, -- Optional

		-- Snippets
		{
			'L3MON4D3/LuaSnip',
			-- follow latest release.
			version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			dependencies = {'rafamadriz/friendly-snippets'}, -- must put here for this to work
		},
		{'rafamadriz/friendly-snippets'},
	},
}

local opts = {
	install = {
		colorscheme = { "onedark" }
	},
	ui = {
		size = {width = 0.8, height = 0.725},
		wrap = true,
		border = "shadow"
	}
}

require("lazy").setup(plugins, opts)
