require('luasnip').config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave',
  update_events = 'TextChanged, TextChangedI',

  -- Enable autotriggered snippets
  enable_autosnippets = true,
  -- Use Tab to trigger visual selection
  store_selection_keys = "<Tab>",
})

require('luasnip.loaders.from_vscode').lazy_load({
	exclude = { "tex" },
})
require('luasnip.loaders.from_lua').lazy_load({ paths = "./snippets" })

vim.cmd([[
	" Expand or jump in insert mode
	imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

	" Jump forward through tabstops in visual mode
	smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

	" Jump backward through snippet tabstops with Shift-Tab
	imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
	smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])
