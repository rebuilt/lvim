local M = {}

M.config = function()
	local lspconfig = require("lspconfig")
	local configs = require("lspconfig/configs")

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}

	if not lspconfig.emmet_ls then
		configs.emmet_ls = {
			default_config = {
				cmd = { "emmet-ls", "--stdio" },
				filetypes = {
					"html",
					"css",
					"javascript",
					"eruby",
					"typescriptreact",
					"javascriptreact",
					"svelte",
					"vue",
				},
				root_dir = function(fname)
					return vim.loop.cwd()
				end,
				settings = {},
			},
		}
	end
	lspconfig.emmet_ls.setup({ capabilities = capabilities })
end

return M
