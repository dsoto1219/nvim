-- load general configuration
<<<<<<< HEAD
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
		require("config.autocmds")
	end,
})
require("config.options")

require("config.plugins")
=======
-- vim.api.nvim_create_autocmd("User", {
	-- pattern = "VeryLazy",
	-- callback = function()
	-- end,
-- })
require("config.autocmds")
require("config.keymaps")
require("config.options")

require("config.lazy")
>>>>>>> 6265402 (fixed telescope issue, new colorscheme)
