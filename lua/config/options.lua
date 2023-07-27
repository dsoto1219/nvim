local options = {
	clipboard = "unnamedplus",
	belloff = "all",
	mouse = "a",
	updatetime = 300,
	shiftwidth = 4,
	termguicolors = true, -- more color options
	tabstop = 4,
	cursorline = true,
	number = true,
	relativenumber = true,

	-- indentation
	showtabline = 2,
	smartindent = true,

	-- misc
	paste = false, --https://stackoverflow.com/a/13172741/18031673
}

for k,v in pairs(options) do
	vim.opt[k] = v
end

-- default terminal is powershell
if vim.fn.has('win32') == 1 then
  vim.o.shell = 'pwsh.exe'
end

-- colors
vim.cmd([[colorscheme default]])
vim.cmd([[highlight Pmenu ctermbg=black guibg=black]])
