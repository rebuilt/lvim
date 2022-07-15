local M = {}

M.config = function()
	vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "emmet_ls" })
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
