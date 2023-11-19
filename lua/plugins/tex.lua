return {
  {
    'lervag/vimtex',
    ft = 'tex',
    config = function()
      vim.cmd([[
        " let g:vimtex_indent_ignored_envs = ['document', 'verbatim', 'lstlisting', 'frame']
        let g:vimtex_quickfix_mode=0
        setlocal indentexpr=
      ]])
    end,
  },
  {
    'KeitaNakamura/tex-conceal.vim',
    ft = 'tex',
    config = function()
      vim.cmd([[
        let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
        let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

        set conceallevel=0
        let g:tex_conceal="abdmgs"
      ]])
    end
  }
}
