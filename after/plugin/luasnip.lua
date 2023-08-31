local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
    return
end

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
require('luasnip.loaders.from_lua').lazy_load({ paths = "./lua/snippets" })

local opts = {remap = true, silent = true}

-- vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, opts)
-- vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, opts)
-- vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, opts)

-- vim.keymap.set({"i", "s"}, "<C-E>", function()
	--if ls.choice_active() then
		-- ls.change_choice(1)
	-- end
-- end, opts)
