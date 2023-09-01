return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
	size = 15,
	open_mapping = [[<c-\>]],
	highlights = {
	    Normal = {
		guibg = "black",
		ctermbg = "black"
	    }
	},
	shading_factor = -100,
	hide_numbers = true,
	autochdir = true,
	direction = "horizontal",
    }
}
