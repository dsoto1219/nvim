vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("keymaps")
		require("autocmds")
	end,
})

require("options") 
