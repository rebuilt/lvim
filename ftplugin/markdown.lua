lvim.lang.markdown = {
	linters = { { exe = "write_good" }, { exe = "markdownlint" } },
	formatters = { { exe = "prettier" } },
}
require("lsp.null-ls").setup("markdown")
