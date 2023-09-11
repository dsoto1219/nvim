vim.cmd([[
    augroup AllFileTypeOptions
	autocmd!
	autocmd FileType * 
	    \ setlocal formatoptions-=c formatoptions-=r formatoptions-=o |
	    \ filetype plugin indent on | 
	    \ syntax enable | 
	    \ hi Visual guifg=White guibg=LightBlue gui=none
    augroup END

    function! s:latexSurround() 
      let b:surround_{char2nr("e")} 
	\ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}" 
      let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
    endfunction

    augroup FileSpecific
	autocmd!
	autocmd FileType java setlocal ts=8 sts=8 expandtab
	autocmd FileType tex 
	    \ setlocal wrap linebreak nolist |
	    \ set formatoptions=tcroqln comments+=b:\\item |
	    inoremap <expr> <CR> getline('.') =~ '\item $' ? '<c-w><c-w>' : '<CR>' |
	    \ call s:latexSurround()
	autocmd BufRead,BufNewFile *.tex set comments:+=b:\\item
    augroup END
]])
