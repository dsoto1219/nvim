local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local powershell_options = {
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

toggleterm.setup({
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
})
