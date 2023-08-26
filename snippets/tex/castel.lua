-- A port of Gilles Castel's LaTeX UltiSnip snippets to Luasnip.
-- https://github.com/gillescastel/latex-snippets/blob/master/tex.snippets
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s({trig = "template"},
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
-		]],
			{ i(1) }
		),
		{condition = line_begin}
	),
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
	  ),
	  {condition = line_begin}
	),
}
