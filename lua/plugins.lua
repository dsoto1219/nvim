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
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	  end,
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  }
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
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"lervag/vimtex",
	"iamcco/markdown-preview.nvim",

	-- cmp plugins
	"hrsh7th/nvim-cmp",

	-- snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets"
}

local opts = {}

require("lazy").setup(plugins, opts)
