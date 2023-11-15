local function set_options(table)
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

  -- :help tabstop
  tabstop = 8,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = false,

  -- other indentation options
  autoindent = true,
  smartindent = false, -- https://www.reddit.com/r/vim/wiki/vimrctips/#wiki_do_not_use_smartindent
}
set_options(options)

-- If using Windows, set powershell as the default
local operating_system = vim.loop.os_uname().sysname
if operating_system == "Windows_NT" then
  local powershell_options = {
    -- options to turn powershell on (from https://github.com/akinsho/toggleterm.nvim/wiki/Tips-and-Tricks#using-toggleterm-with-powershell)
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }
  set_options(powershell_options)
end
