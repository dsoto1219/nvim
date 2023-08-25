require('luasnip').config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave',

  -- Enable autotriggered snippets
  enable_autosnippets = true,
  -- Use Tab to trigger visual selection
  store_selection_keys = "<Tab>",
})

require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_lua').lazy_load({ paths = "./LuaSnip" })
