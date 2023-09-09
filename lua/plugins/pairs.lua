return {
    {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	opts = {},
	config = function()
	    local npairs = require("nvim-autopairs")
	    npairs.setup {}

	    -- configure with nvim-cmp
	    local cmp_status_ok, cmp = pcall(require, 'cmp')
	    if cmp_status_ok then
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		cmp.event:on(
		  'confirm_done',
		  cmp_autopairs.on_confirm_done()
		)
	    end

	    -- completion rules
	    local Rule = require('nvim-autopairs.rule')
	    npairs.add_rules({
		-- multi-line commenting in c, c++, java
	    	Rule("/*", "*/", {"c", "cc", "cpp", "cp", "java"}),
		-- tex/latex
	    	Rule("$", "$", {"tex", "latex"})
		    :with_move(function(opts)
			return opts.next_char == opts.char
		    end),
	    	Rule("\\[", "\\]", {"tex", "latex"}),
	    	Rule("\\{", "\\}", {"tex", "latex"})
	    })
	end
    },
    { 'tpope/vim-surround' }
}
