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
	wrap = false,

	-- indentation
	showtabline = 2,
	smartindent = true,
	autoindent = true,
	scrolloff = 8,

	-- misc
	paste = false, --https://stackoverflow.com/a/13172741/18031673

	-- turn powershell on, https://github.com/akinsho/toggleterm.nvim/wiki/Tips-and-Tricks#using-toggleterm-with-powershell
	shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
	shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
	shellquote = "",
	shellxquote = "",
}

for k,v in pairs(options) do
	vim.opt[k] = v
end

-- misc vim.cmd commands
local commands = {
	'filetype plugin indent on',
	'syntax enable',
	-- 'highlight Pmenu ctermbg=black guibg=black',
	'hi Visual  guifg=White guibg=LightBlue gui=none', -- https://stackoverflow.com/a/3076780/18031673
}

for i=1, #commands do
	vim.cmd(commands[i])
end
