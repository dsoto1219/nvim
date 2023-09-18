vim.cmd([[
    augroup AllFileTypeOptions
	autocmd!
	autocmd FileType * 
	    \ setlocal formatoptions-=c formatoptions-=r formatoptions-=o |
	    \ filetype plugin indent on | 
	    \ syntax enable | 
	    \ hi Visual guifg=White guibg=LightBlue gui=none
    augroup END

    augroup FileSpecific
	autocmd!
	autocmd FileType java setlocal ts=8 sts=8 expandtab
	autocmd FileType tex setlocal wrap linebreak nolist indentexpr=
    augroup END

    augroup TexComments
	autocmd!
	au BufRead,BufNewFile *.tex set comments+=b:\\item 
    augroup END
]])
