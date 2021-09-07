lvim.lang.markdown = {
	-- linters = { { exe = "write_good" }, { exe = "markdownlint" }, { exe = "codespell" } },
	linters = { { exe = "codespell" } },
	formatters = { { exe = "prettier" } },
}
require("lsp.null-ls").setup("markdown")
