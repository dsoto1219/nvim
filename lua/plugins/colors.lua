return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    -- opts = { transparent = true },
    config = function(_, opts)
	local onedark = require('onedark')
	onedark.setup(opts)
	onedark.load()
    end
}
