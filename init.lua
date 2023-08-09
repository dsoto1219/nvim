-- vim.api.nvim_create_autocmd("User", {
	-- pattern = "VeryLazy",
	-- callback = function()
	-- end,
-- })
require("config.autocmds")
require("config.options")
require("config.keymaps")

require("config.lazy")
