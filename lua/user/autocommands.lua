local M = {}

M.setup = function()
	lvim.autocommands.custom_groups = {
		-- { "CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics()" },
		-- { "Filetype", "python", "lua require('cmp').setup.buffer({completion = {autocomplete = false}})" },
	}
end

-- M.disable_python_autocomplete = function()
-- 	local filetype = vim.bo.filetype

-- 	local enable_autocomplete = true
-- 	if filetype == "python" then
-- 		enable_autocomplete = false
-- 	end

-- 	require("cmp").setup({ completion = { autocomplete = enable_autocomplete } })
-- end

return M
