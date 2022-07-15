local M = {}

M.setup = function()
	lvim.autocommands = {
		-- { "CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics()" },
		-- { "BufWritePre", "*", "lua require('user.tidy').tidy_up()" },
		{ "BufNewFile,BufRead", "*", "echo 'hello'" },
	}
end

return M
