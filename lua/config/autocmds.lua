vim.cmd([[
  augroup AllFileTypes
    autocmd!
    autocmd FileType * 
      \ setlocal formatoptions-=c formatoptions-=r formatoptions-=o |
      \ filetype plugin indent on | 
      \ syntax enable | 
      \ hi Visual guifg=White guibg=LightBlue gui=none
  augroup END

  augroup FileTypeTabsize
    autocmd!
    autocmd FileType java setlocal tabstop=8 softtabstop=8 expandtab
    autocmd FileType haskell,lua,html,css,js setlocal tabstop=8 softtabstop=2 shiftwidth=2 expandtab
  augroup END

  augroup Tex
    autocmd!
    autocmd FileType tex 
      \ setlocal wrap linebreak nolist indentexpr=|
      \ set formatoptions=tcroqln |
      \ set comments+=b:\\item
    autocmd BufRead,BufNewFile *.tex inoremap <expr> <CR> getline('.') =~ '\item $' ? '<c-w><c-w>' : '<CR>'
  augroup END
]])
