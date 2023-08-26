local options = {
	number = true,
	relativenumber = true,

	clipboard = "unnamedplus",
	belloff = "all",
	mouse = "a",
	updatetime = 300,
	termguicolors = true, -- more color options
	cursorline = true,

	autochdir = true;
	ignorecase = true;
	scrolloff = 8,
	paste = false, --https://stackoverflow.com/a/13172741/18031673

	-- indentation
	tabstop = 4,
	shiftwidth = 4,
	showtabline = 2,
	smartindent = true,
	autoindent = true,
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
