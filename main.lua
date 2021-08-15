-- General settings for neovim
-- =========================================
-- lvim.log.level = "debug"
lvim.format_on_save = true

vim.opt.timeoutlen = 1000
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.inccommand = "split"

lvim.builtin.dap.active = false
lvim.builtin.dashboard.active = false
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.auto_open = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.telescope.extensions = {
	fzy_native = {
		override_generic_sorter = false,
		override_file_sorter = true,
	},
}
vim.cmd([[command! Gpush term git push]])
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
lvim.colorscheme = "onedark"
