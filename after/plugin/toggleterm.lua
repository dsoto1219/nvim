local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_ok then
	return
end

toggleterm.setup({
	shade_terminals = true,
	autochdir = true,
	shading_factor = 2,
	direction = "float",
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
