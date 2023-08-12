local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
	return
end

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

nvim_tree.setup()

local opts = {noremap = true, silent = true}

vim.keymap.set("n", "<leader>pv", ":NvimTreeFocus<CR>", opts)
