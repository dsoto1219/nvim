-- A port of Gilles Castel's LaTeX UltiSnip snippets to Luasnip.
-- You can find his original tex.snippets file at https://github.com/gillescastel/latex-snippets/blob/master/tex.snippets
-- Much inspiration is taken from the following tutorials:
-- 1. https://www.ejmastnak.com/tutorials/vim-latex/luasnip/ 
-- 2. https://evesdropper.dev/files/luasnip/ultisnips-to-luasnip/

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end


local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local function comment()
    return vim.api.nvim_eval('vimtex#syntax#in_comment()') == 1
end

-- source: https://evesdropper.dev/files/luasnip/ultisnips-to-luasnip/#conditionscontext-dependent-snippets
local function env(name)
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

return {
	s({trig = "template", dscr="Basic Template"},
	    fmta(
	    [[
	    \documentclass[a4paper]{article}

	    \usepackage[utf8]{inputenc}
	    \usepackage[T1]{fontenc}
	    \usepackage{textcomp}
	    \usepackage[dutch]{babel}
	    \usepackage{amsmath, amssymb}


	    % figure support
	    \usepackage{import}
	    \usepackage{xifthen}
	    \pdfminorversion=7
	    \usepackage{pdfpages}
	    \usepackage{transparent}
	    \newcommand{\incfig}[1]{%
		    \def\svgwidth{\columnwidth}
		    \import{./figures/}{#1.pdf_tex}
	    }

	    \pdfsuppresswarningpagegroup=1

	    \begin{document}
		<>
	    \end{document}
	    ]],
		    { i(1) }
	    ),
	    {condition = line_begin}
	),

	s({trig="beg", "begin{} / end{}", snippetType="autosnippet"},
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
	  ),
	  {condition = line_begin}
	),

	s({trig="...", dscr="dots", snippetType="autosnippet"},
	    {t("\\ldots")}
	),

	s({trig="table", dscr="Table Environment"},
	    fmta(
		[[
		\begin{table}[<>]
			\centering
			\caption{<>}
			\label{tab:<>}
			\begin{tabular}{<>}
			    <>
			\end{tabular}
		\end{table}	    
		]],
		{
		    i(1, "htpb"),
		    i(2, "caption"),
		    i(3, "label"),
		    i(4, "c"),
		    i(5, "Actual table")
		}
	    ),
	    {condition = line_begin}
	),

	s({trig="fig", dscr="Figure environment"},
	    fmta(
		[[
		    \begin{figure}[<>]
			\centering
			    \includegraphics[width=0.8\textwidth]{<>}
			\caption{<>}
			\label{fig:<>}
		    \end{figure}
		]],
		{
		    i(1, "htpb"),
		    i(2),
		    i(3),
		    i(4)
		},
		{condition = line_begin}
	    )
	),

	s({trig="enum", dscr="Enumerate", snippetType="autosnippet"},
	    fmta(
	    [[
		\begin{enumerate}
		    \item <>
		\end{enumerate}
	    ]],
	    { i(1) }
	    ),
	    {condition = line_begin}
	),

	s({trig="item", dscr="Itemize", snippetType="autosnippet"},
	    fmta(
	    [[
		\begin{itemize}
		    \item <>
		\end{itemize}
	    ]],
	    { i(1) }
	    ),
	    {condition = line_begin}
	),

	s({trig="desc", dscr="Description"},
	    fmta(
	    [[
		\begin{description}
		    \item[<>] <>
		\end{description}
	    ]],
	    { i(1), i(2)}
	    ),
	    {condition = line_begin}
	),

	s({trig="pac", dscr="Package"},
	    fmta("\\usepackage[<>]{<>}", { i(1), i(2, "package") }),
	    {condition = line_begin}
	),

	s({trig="=>", dscr="implies"},
	    { t("\\implies") }
	),
	s({trig="=<", dscr="implied by"},
	    { t("\\implies") }
	),

	s({trig="iff", dscr="iff", snippetType="autosnippet"},
	    { t("\\iff") },
	    { condition=math, show_condition=math}
	),

	-- mk snippet placeholder, right now it is not the exact same as Castel's "smart" version
	s({trig = "mk", dscr="Math", wordTrig = false, snippetType="autosnippet"},
	  fmta(
	    "$<>$",
	    { i(1) }
	  )
	),

	s({trig="dm", dscr="Math", wordTrig = false, snippetType="autosnippet"},
	    fmta(
		[[
		\[
		<>
		.\] <>
		]],
		{
		    i(1),
		    i(0)
		}
	    )
	),

	s({trig="ali", dscr="Align", snippetType="autosnippet"},
	    fmta(
	    [[
		\begin{align*}
		    <>
		.\end{align*}
	    ]],
	    { d(1, get_visual) }
	    ),
	    {condition = line_begin}
	),

	s({trig="//", dscr="Fraction", wordTrig = false, snippetType="autosnippet"},
	     fmta("\\frac{<>}{<>}", { i(1), i(2) }),
	     {condition = math}
	),

	s({trig="//", dscr="Fraction", wordTrig = false},
	     fmta("\\frac{<>}{<>}", { d(1, get_visual), i(2) })
	),
}
