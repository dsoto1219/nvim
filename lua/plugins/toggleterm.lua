return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	autochdir = true,
	shade_terminals = true,
	direction = "float",
	float_opts = {
	    border = "curved",
	    winblend = 3,
	    highlights = {
		border = "Normal",
		background = "Normal",
	    }
	}
    }
}
