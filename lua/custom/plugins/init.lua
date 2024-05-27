-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-surround',
  {
    'lervag/vimtex',
    dependencies = {
      'tpope/vim-surround',
    },
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.cmd [[
          let g:vimtex_view_general_viewer = 'SumatraPDF'
          let g:vimtex_view_general_options 
              \ = '-reuse-instance -forward-search @tex @line @pdf'
          let b:surround_{char2nr('e')}
              \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
          let b:surround_{char2nr('c')} = "\\\1command: \1{\r}"
        ]]
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<c-\>]],
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)
      -- [ Terminal mappings ]
      function _G.set_terminal_keymaps()
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 })
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { buffer = 0 })
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { buffer = 0 })
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { buffer = 0 })
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { buffer = 0 })
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { buffer = 0 })
      end

      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
    end,
  },
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      default_file_explorer = true,
      columns = {
        'icon',
        'permissions',
        'size',
        -- 'mtime',
      },
    },
    config = function(_, opts)
      local oil = require 'oil'
      oil.setup(opts)

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory in current window' })
      vim.keymap.set('n', '<leader>-', oil.toggle_float, { desc = 'Open parent directory in floating window' })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
