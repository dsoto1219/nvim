local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s(
		{ -- Table 1: snippet parameters
			trig = "sign",
			dscr = "A snippet that signs Gilles Castel's name, in his honor.",
			wordTrig = true,
			regTrig = false,
			priority = 100,
			snippetType = "autosnippet"
		},
		{ -- Table 2: snippet nodes
			t("Gilles Castel")
		}
		-- Table 3: advanced snippet options, left blank.
	)

}
