function! s:latexSurround() 
  let b:surround_{char2nr("e")} 
    \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}" 
  let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction

call s:latexSurround()

" (attempt at) auto \item: from https://github.com/lervag/vimtex/issues/455#issuecomment-219851589
set formatoptions=tcroqln
inoremap <expr> <CR> getline('.') =~ '\item $' ? '<c-w><c-w>' : '<CR>'
