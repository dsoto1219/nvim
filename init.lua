-- config
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
		require("config.autocmds")
	end,
})
require("config.options")

-- plugin files
require("plugins") -- can't write require("lazy") or else neovim gets confused between lazy module and lazy plugin
require("cmp-setup")
