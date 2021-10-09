local M = {}

M.setup = function()
	-- cargo install selene
	-- lvim.lang.lua.linters = { { exe = "selene", }, }
	lvim.lang.lua.formatters = { { exe = "stylua" } }
	lvim.lang.css.formatters = { { exe = "prettier" } }
	lvim.lang.html.formatters = { { exe = "prettier" } }
	lvim.lang.javascript.formatters = { { exe = "prettier" } }
	lvim.lang.json.formatters = { { exe = "prettier" } }
	lvim.lang.lua.formatters = { { exe = "stylua" } }
	-- linters = { { exe = "write_good" }, { exe = "markdownlint" }, { exe = "codespell" } },
	lvim.lang.markdown = {
		linters = { { exe = "codespell" } },
		formatters = { { exe = "prettier" } },
	}
	lvim.lang.python.formatters = { { exe = "yapf" }, { exe = "isort" } }
	lvim.lang.python.linters = { { exe = "flake8" } }
	lvim.lang.rust.formatters = { { exe = "rustfmt" } }
	lvim.lang.sh.formatters = { { exe = "shfmt" } }
	lvim.lang.vim.linters = { { exe = "vint" } }
	lvim.lang.vue.formatters = { { exe = "prettier" } }
	lvim.lang.yaml.formatters = { { exe = "prettier" } }
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
