-- General settings for neovim
-- =========================================

lvim.format_on_save = true
lvim.lint_on_save = true
vim.cmd("set timeoutlen=1000")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set hlsearch")

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false

lvim.builtin.dap.active = true
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.auto_open = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"
-- lvim.lang.lua.formatter.exe = "stylua"
lvim.builtin.terminal.active = true
lvim.lsp.default_keybinds = false
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

-- calbacks
require("user.callbacks").setup()

-- language
-- lvim.lang.javascript.formatter.exe = "prettier"

-- colorscheme
vim.g.onedark_style = "darker"
lvim.colorscheme = "onedark"
