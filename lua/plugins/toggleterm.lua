return {
  'akinsho/toggleterm.nvim',
  version = "*",
  -- explicitly setup, as per documentation: https://github.com/akinsho/toggleterm.nvim#setup
  config = function()
    require("toggleterm").setup{
      size = 12,
      open_mapping = [[<C-\>]],
      autochdir = true,
      hide_numbers = true,
      direction = "horizontal",
      shade_terminals = true
    }

    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      local keymap = vim.keymap.set
      keymap('t', '<esc>', [[<C-\><C-n>]], opts)
      keymap('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      keymap('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      keymap('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      keymap('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      keymap("n", "<C-Up>", ":resize +2<CR>", opts)
      keymap("n", "<C-Down>", ":resize -2<CR>", opts)
      keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
      keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        _G.set_terminal_keymaps()
      end
    })
  end,
}
