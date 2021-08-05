-- General settings for neovim
-- =========================================

lvim.debug = true
lvim.format_on_save = true
lvim.lint_on_save = true

vim.opt.timeoutlen = 1000
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false

lvim.builtin.dap.active = true
lvim.builtin.dashboard.active = false
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.auto_open = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"
lvim.builtin.terminal.active = true
lvim.builtin.telescope.extensions = {
	fzy_native = {
		override_generic_sorter = false,
		override_file_sorter = true,
	},
}
-- lvim.builtin.treesitter.indent = { enable = false }

-- plugins
-- =========================================
require("user.plugins").setup()

-- general keybindings
-- =========================================
require("user.keybindings").setup()

-- whichkey bindings
-- =========================================
require("user.whichkey").setup()

-- callbacks
require("user.callbacks").setup()

-- colorscheme
vim.g.onedark_style = "darker"

-- lvim.lang.javascript.formatters = {
-- 	{
-- 		exe = "prettier",
-- 		args = {},
-- 	},
-- }
-- lvim.lang.ruby.formatters = {
-- 	{
-- 		exe = "rufo",
-- 		args = {},
-- 	},
-- }
-- local util = require("lspconfig/util")
-- lvim.lang.ruby.lsp.setup = {
--     cmd = { "solargraph", "stdio" },
--     filetypes = { "ruby" },
--     init_options = {
--       formatting = true
--     },
--     root_dir = util.root_pattern("Gemfile", ".git"),
--     settings = {
--       solargraph = {
--         diagnostics = true
--       }
--     }
-- }