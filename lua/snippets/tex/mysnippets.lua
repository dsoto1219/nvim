local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

return {
	-- Examples of Greek letter snippets, autotriggered for efficiency
	s({trig=";a", snippetType="autosnippet"},
	    { t("\\alpha") }
	),

	s({trig=";b", snippetType="autosnippet"},
	    { t("\\beta") }
	),

	s({trig=";g", snippetType="autosnippet"},
	    { t("\\gamma") }
	),

	s({trig="bb", wordTrig=false},
	     fmta("\\mathbb{<>}", { i(1) }),
	     {condition=math}
	)

}
