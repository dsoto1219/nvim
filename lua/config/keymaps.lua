local which_key_status_ok, which_key = pcall(require, "which-key")
if which_key_status_ok then
	require("which-key")
end

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap leader key
keymap("", "<Space>", "<Nop>", opts) -- initializes space key so that it does nothing in all modes
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- 	normal_mode = "n",
-- 	insert_mode = "i",
-- 	visual_mode = "v",
-- 	visual_block_mode = "x"
-- 	term_mode = "t",
-- 	command_mode = "c"

-- easy save
keymap("", "<C-s>", ":update<CR>", {noremap = true, silent = false})

-- Normal --
-- netrw browse/nvim-tree browse
netrw_disabled = vim.g.loaded_netrwPlugin and vim.g.loaded_netrw
if not netrw_disabled then
	keymap("n", "<leader>pv", ":Lex 30<CR>", opts)
end

-- easy :so 
keymap("n", "<leader><leader>", ":source<CR>", {noremap = true, silent = false})

-- edit .vimrc
keymap("n", "<leader>vm", ":e $MYVIMRC<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-q>", "<C-w>q", opts)


-- Resize window with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Nagivate buffers
keymap("n", "<S-L>", ":bnext<CR>", opts)
keymap("n", "<S-H>", ":bprevious<CR>", opts)

-- Visual -- 
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- Paste without yanking
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- open terminal in terminal mode (all modes)
-- below current window
keymap("n", "<Leader>t", ":belowright split | term<CR>i", opts)

-- mapping to go from terminal mode to terminal-normal mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
