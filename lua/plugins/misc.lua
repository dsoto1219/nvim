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
    -- "nathom/filetype.nvim",
    -- "sevko/vim-nand2tetris-syntax",
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
}

