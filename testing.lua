-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping

vim.opt.smartindent = false
vim.opt.number = true
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = { "python" }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- lvim.plugins = {
-- 	{
-- 		"aca/emmet-ls",
-- 		config = function()
-- 			local lspconfig = require("lspconfig")
-- 			local configs = require("lspconfig/configs")

-- 			local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 			capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 			capabilities.textDocument.completion.completionItem.resolveSupport = {
-- 				properties = {
-- 					"documentation",
-- 					"detail",
-- 					"additionalTextEdits",
-- 				},
-- 			}

-- 			if not lspconfig.emmet_ls then
-- 				configs.emmet_ls = {
-- 					default_config = {
-- 						cmd = { "emmet-ls", "--stdio" },
-- 						filetypes = {
-- 							"html",
-- 							"css",
-- 							"javascript",
-- 							"typescript",
-- 							"eruby",
-- 							"typescriptreact",
-- 							"javascriptreact",
-- 							"svelte",
-- 							"vue",
-- 						},
-- 						root_dir = function(fname)
-- 							return vim.loop.cwd()
-- 						end,
-- 						settings = {},
-- 					},
-- 				}
-- 			end
-- 			lspconfig.emmet_ls.setup({ capabilities = capabilities })
-- 		end,
-- 	},
-- }
