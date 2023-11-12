function set_options(table)
    for k,v in pairs(table) do
	vim.opt[k] = v
    end
end

-- General Options
local options = {
    number = true,
    relativenumber = true,

    belloff = "all",
    mouse = "a",
    updatetime = 300,
    termguicolors = true, -- more color options
    cursorline = true,

    autochdir = true;
    ignorecase = true;
    wrap = false,
    scrolloff = 8,
    paste = false, --https://stackoverflow.com/a/13172741/18031673

    -- https://www.reddit.com/r/vim/wiki/tabstop/
    tabstop = 8,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = false,
    -- other indentation options
    showtabline = 2,
    autoindent = true,
    smartindent = false, -- https://www.reddit.com/r/vim/wiki/vimrctips/#wiki_do_not_use_smartindent

}

set_options(options)


local operating_system = vim.loop.os_uname().sysname
-- Windows options
if operating_system == "Windows" then

    local powershell_options = {
	-- turn powershell on, https://github.com/akinsho/toggleterm.nvim/wiki/Tips-and-Tricks#using-toggleterm-with-powershell
	shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
	shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
	shellquote = "",
	shellxquote = "",

    }
    set_options(powershell_options)
end

-- for faster startuptime, we tell vim which clipboard to use so it doesn't have to find it at startuptime:
if vim.fn.has("Windows") then
    -- from https://github.com/neovim/neovim/issues/9570#issuecomment-1503748366
    vim.g.clipboard = {
      name = 'win32yank',
      copy = {
	 ["+"] = 'win32yank.exe -i --crlf',
	 ["*"] = 'win32yank.exe -i --crlf',
       },
      paste = {
	 ["+"] = 'win32yank.exe -o --lf',
	 ["*"] = 'win32yank.exe -o --lf',
      },
      cache_enabled = 0,
    }
end

-- cross-platform clipboard option (from https://stackoverflow.com/a/30691754/18031673)
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' } 
