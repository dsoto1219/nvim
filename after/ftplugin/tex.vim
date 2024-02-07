" Get more vim-surround support. See :help vimtex-faq-surround
let b:surround_{char2nr('e')}
 \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
let b:surround_{char2nr('c')} = "\\\1command: \1{\r}"

if has('win32unix')
	echo "Zathura, anyone?"
elseif has('win32')
	echo "SumatraPDF, anyone?"
endif

" for auto-item
inoremap <expr> <CR> getline('.') =~ '\item $' ? '<c-w><c-w>' : '<CR>'
