require('mason').setup()

require('mason-lspconfig').setup({
	ensure_installed = {
	  -- Replace these with whatever servers you want to install
	  'lua_ls',
	  'clangd',
	}
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
-- Create your keybindings here...
end

local lspconfig = require('lspconfig')
local get_servers = require('mason-lspconfig').get_installed_servers

for _, server_name in ipairs(get_servers()) do
lspconfig[server_name].setup({
  on_attach = lsp_attach,
  capabilities = lsp_capabilities,
})
end

lspconfig.lua_ls.setup{
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
