-- configure cmp with luasnip
-- from: https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/#snippets
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	snippet = {
	  expand = function(args)
		luasnip.lsp_expand(args.body)
	  end
	},
	sources = {
	  {name = 'luasnip', keyword_length = 2},
	  {name = 'path'},
	  {name = 'nvim_lsp', keyword_length = 1},
	  {name = 'buffer', keyword_length = 3},
	},
	window = {
	  documentation = cmp.config.window.bordered()
	},
	formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<C-y>'] = cmp.mapping.confirm({select = true}),
		['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
		['<C-j>'] = cmp.mapping.select_next_item(select_opts),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-f>'] = cmp.mapping(function(fallback)
		  if luasnip.jumpable(1) then
			luasnip.jump(1)
		  else
			fallback()
		  end
		end, {'i', 's'}),
		['<C-b>'] = cmp.mapping(function(fallback)
		  if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		  else
			fallback()
		  end
		end, {'i', 's'}),
		-- Supertab
		['<Tab>'] = cmp.mapping(function(fallback)
		  local col = vim.fn.col('.') - 1

		  if cmp.visible() then
			cmp.select_next_item(select_opts)
		  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
			fallback()
		  else
			cmp.complete()
		  end
		end, {'i', 's'}),
		['<S-Tab>'] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_prev_item(select_opts)
		  else
			fallback()
		  end
		end, {'i', 's'}),
	}
})
