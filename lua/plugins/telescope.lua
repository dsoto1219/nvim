return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	vim.g.mapleader = " "
	local builtin = require('telescope.builtin')

	local opts = {noremap = true, silent = true}

	vim.keymap.set('n', '<leader>pf', builtin.find_files, opts) 
	vim.keymap.set('n', '<C-p>', builtin.git_files, opts)
	vim.keymap.set('n', '<leader>ps', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)
	vim.keymap.set('n', '<leader>vh', builtin.help_tags, opts)
    end
}
