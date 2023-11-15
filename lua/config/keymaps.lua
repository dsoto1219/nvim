local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap leader key
keymap("n", "<Space>", "<Nop>", opts) -- initializes space key so that it does nothing in all modes
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- 	normal_mode = "n",
-- 	insert_mode = "i",
-- 	visual_mode = "v",
-- 	visual_block_mode = "x"
-- 	term_mode = "t",
-- 	command_mode = "c"

-- Normal --
-- netrw browse/nvim-tree browse
local netrw_disabled = vim.g.loaded_netrwPlugin and vim.g.loaded_netrw
if not netrw_disabled then
  keymap("n", "<leader>pv", ":Lex 30<CR>", opts)
end

-- toggle autocommenting 
vim.keymap.set("n", "<leader>cm", function()
  -- bo stands for buffer options: https://www.reddit.com/r/neovim/comments/mmhwgc/comment/gtrnwct/?utm_source=share&utm_medium=web2x&context=3
  local bfo = vim.bo.formatoptions
  local ofo = vim.opt.formatoptions

  -- https://stackoverflow.com/a/10158547/18031673
  if bfo:find("c") and bfo:find("r") and bfo:find("o") then
    -- https://www.reddit.com/r/neovim/comments/mmhwgc/comment/hue7voe/?utm_source=share&utm_medium=web2x&context=3
    ofo:remove("c")
    ofo:remove("r")
    ofo:remove("o")
    print("Autocommenting off")
  else
    ofo:append("c")
    ofo:append("r")
    ofo:append("o")
    print("Autocommenting on")
  end
end, opts)

-- edit .vimrc
keymap("n", "<leader>vm", ":e $MYVIMRC<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Easy :noh
keymap("n", "<leader>n", ":noh<CR>", opts)

-- Resize window with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

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

-- Select Mode --
keymap("s", "p", "<BS>ap", opts)
