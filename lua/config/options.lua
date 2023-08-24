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
	autochdir = true;
	ignorecase = true;

	-- indentation
	showtabline = 2,
	smartindent = true,
	autoindent = true,
	scrolloff = 8,

	-- misc
	paste = false, --https://stackoverflow.com/a/13172741/18031673
}

for k,v in pairs(options) do
	vim.opt[k] = v
end

-- turn off auto commenting
vim.opt.formatoptions:remove{ "c", "r", "o" }

-- vim.cmd([[highlight Pmenu ctermbg=black guibg=black]])

-- misc vim.cmd commands
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
