-- vim.opt.timeoutlen = 1000
-- lvim.debug = true
lvim.format_on_save = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.dashboard.active = true

-- lvim.lang.markdown.formatters = {
-- 	{
-- 		exe = "write_good",
-- 		args = { "--text=$TEXT", "--parse" },
-- 	},
-- }

lvim.autocommands.custom_groups = {
	{ "BufWritePre", "*.md", "!write-good %" },
}
-- lvim.lsp.on_attach_callback = function()
-- 	local null_ls = require("null-ls")
-- 	local sources = {
-- 		null_ls.builtins.diagnostics.write_good,
-- 	}
--
-- 	null_ls.config({ sources = sources })
-- end
