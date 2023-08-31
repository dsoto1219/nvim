  -- snippets
return  {
    "L3MON4D3/LuaSnip",
    dependencies = {
	"rafamadriz/friendly-snippets",
	config = function()
	    require("luasnip.loaders.from_vscode").lazy_load({
		exclude = { "tex" },
	    })
	end,
    },
    config = function()
	require("luasnip").config.set_config({
	    history = true,
	    enable_autosnippets = true,
	})
	require("luasnip.loaders.from_lua").load({ paths = "./lua/snippets"})
    end,
    -- stylua: ignore
    keys = {
	{
	"<Tab>",
	function()
	    return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
	end,
	expr = true, silent = true, mode = "i",
	},
	{ "<Tab>", function() require("luasnip").jump(1) end, mode = "s" },
	{ "<S-Tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
}
