<<<<<<< HEAD
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
=======
vim.g.mapleader = " "
local builtin = require('telescope.builtin')

opts = {noremap = true, silent = true}

vim.keymap.set('n', '<leader>pf', builtin.find_files, opts) 
vim.keymap.set('n', '<C-p>', builtin.git_files, opts)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, opts)
>>>>>>> 6265402 (fixed telescope issue, new colorscheme)
