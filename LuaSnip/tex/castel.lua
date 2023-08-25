local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

return {
	s({trig="beg", snippetType="autosnippet"},
	  fmta(
		[[
		  \begin{<>}
			  <>
		  \end{<>}
		]],
		{
		  i(1),
		  i(2),
		  rep(1),  -- this node repeats insert node i(1)
		}
	  )
	),
}
