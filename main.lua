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
vim.opt.scrolloff = 0
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.smartindent = false
lvim.line_wrap_cursor_movement = false

lvim.builtin.dap.active = false
lvim.builtin.dashboard.active = false
lvim.builtin.comment.active = false
lvim.builtin.terminal.active = true
lvim.builtin.telescope.defaults.find_command = { "rg" }
lvim.builtin.project.active = true
-- lvim.builtin.project.silent_chdir = false
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.auto_open = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.telescope.extensions = {
	fzy_native = {
		override_generic_sorter = false,
		override_file_sorter = true,
	},
}

vim.g["vsnip_filetypes"] = {}
vim.g.vsnip_filetypes["javascriptreact"] = { "html" }
vim.g.vsnip_filetypes["javascriptreact"] = { "javascript" }
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

-- additional lsp configs
require("user.lsp").config()
-- colorscheme
vim.g.onedark_style = "darker"
lvim.colorscheme = "onedark"

-- autocommands
require("user.autocommands").setup()
