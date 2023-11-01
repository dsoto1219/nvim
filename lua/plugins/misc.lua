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
 --    {
	-- "lukas-reineke/indent-blankline.nvim",
	-- dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- opts = {
	--     show_first_indent_level = false,
	-- },
	-- config = function(_, opts)
	--     require("indent_blankline").setup(opts)
	--     vim.cmd("highlight IndentBlanklineChar guifg=gray gui=nocombine")
	-- end
 --    },
    -- "sevko/vim-nand2tetris-syntax",
}
