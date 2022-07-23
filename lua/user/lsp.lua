local M = {}

M.config = function()
	local lspconfig = require("lspconfig")
	local configs = require("lspconfig/configs")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	lspconfig.emmet_ls.setup({
		-- on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby" },
	})
end

return M
