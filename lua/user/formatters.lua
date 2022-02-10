local M = {}

M.setup = function()
	local formatters = require("lvim.lsp.null-ls.formatters")
	formatters.setup({
		{ exe = "black" },
		{ exe = "stylua" },
		{ exe = "prettierd" },
		{ exe = "markdownlint" },
		{ exe = "codespell" },
		{ exe = "shfmt" },
		{ exe = "rustfmt" },
		{ exe = "rubocop" },
	})
end

return M
-- local null_ls = require("null-ls")

-- lvim.format_on_save = true

-- local sources = {

-- 	-- Formatters
-- 	-- null_ls.builtins.formatting.eslint_d,
-- 	-- null_ls.builtins.formatting.fixjson,
-- 	-- null_ls.builtins.formatting.mix,
-- 	-- null_ls.builtins.formatting.stylua,

-- 	-- Linters
-- 	-- null_ls.builtins.diagnostics.eslint_d,
-- 	null_ls.builtins.diagnostics.rubocop,
-- 	-- null_ls.builtins.diagnostics.shellcheck,
-- 	-- null_ls.builtins.diagnostics.markdownlint,
-- 	-- null_ls.builtins.diagnostics.write_good,
-- }

-- -- Enable the formatters and linters.
-- null_ls.register({ sources = sources })
