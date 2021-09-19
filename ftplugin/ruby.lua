lvim.lang.ruby.formatters = {
	-- { exe = "rubocop" },
}

local util = require("lspconfig/util")
lvim.lang.ruby.lsp.setup = {
	cmd = { "solargraph", "stdio" },
	filetypes = { "ruby" },
	init_options = {
		formatting = true,
	},
	root_dir = util.root_pattern("Gemfile", ".git"),
	settings = {
		solargraph = {
			diagnostics = true,
		},
	},
}
