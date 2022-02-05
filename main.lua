-- General settings for neovim
-- =========================================
-- lvim.log.level = "debug"
lvim.format_on_save = false
lvim.lsp.automatic_servers_installation = true

vim.opt.timeoutlen = 1000
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.inccommand = "split"
vim.opt.scrolloff = 0
vim.opt.smartindent = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

lvim.line_wrap_cursor_movement = false

lvim.builtin.dap.active = false
lvim.builtin.dashboard.active = false
lvim.builtin.comment.active = false
lvim.builtin.terminal.active = true
lvim.builtin.project.active = true
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.setup.open_on_setup = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"
lvim.builtin.telescope.active = false

lvim.lsp.diagnostics.virtual_text = false

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
-- vim.g.onedark_style = "darker"
-- lvim.colorscheme = "catppuccino"

-- autocommands
require("user.autocommands").setup()

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "black" },
	{ exe = "stylua" },
	{ exe = "prettier" },
	{ exe = "markdownlint" },
	{ exe = "codespell" },
	{ exe = "shfmt" },
	{ exe = "rustfmt" },
	{ exe = "rubocop" },
})
