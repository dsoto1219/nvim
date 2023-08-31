-- for nvim-qt.exe to start in a different directory
-- local os = require("os")

-- local path_to_desktop = os.getenv("USERPROFILE") .. "\\Desktop"

-- local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

-- vim.api.nvim_create_autocmd(
--    {"VimEnter"},
--    { pattern = "*", command = "cd " .. path_to_desktop, group = vim_enter_group }
--)

vim.cmd([[
    augroup AllFileTypeOptions
	autocmd!
	autocmd FileType * 
	    \ setlocal formatoptions-=c formatoptions-=r formatoptions-=o |
	    \ filetype plugin indent on | 
	    \ syntax enable | 
	    \ hi Visual guifg=White guibg=LightBlue gui=none
    augroup END
]])
