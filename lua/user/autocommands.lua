local M = {}

M.setup = function()
	lvim.autocommands.custom_groups = {
		-- { "CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics()" },
		-- { "BufWritePre", "*", "lua require('user.tidy').tidy_up()" },
    {"BufNewFile,BufRead", "*.html.erb", "set filetype=html"},
	}
end

return M
