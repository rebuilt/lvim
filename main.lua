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
-- vim.g.onedark_style = "darker"
lvim.colorscheme = "catppuccino"

-- autocommands
require("user.autocommands").setup()

-- require("user.formatters").setup()
-- cargo install selene
-- lvim.lang.lua.linters = { { exe = "selene", }, }

lvim.lang.lua.formatters = { { exe = "stylua" } }
lvim.lang.css.formatters = { { exe = "prettier" } }
lvim.lang.html.formatters = { { exe = "prettier" } }
lvim.lang.javascript.formatters = { { exe = "prettier" } }
lvim.lang.json.formatters = { { exe = "prettier" } }
lvim.lang.lua.formatters = { { exe = "stylua" } }

-- linters = { { exe = "write_good" }, { exe = "markdownlint" }, { exe = "codespell" } },
lvim.lang.markdown = {
	linters = { { exe = "codespell" } },
	formatters = { { exe = "markdownlint" } },
}

lvim.lang.python.formatters = { { exe = "yapf" }, { exe = "isort" } }
lvim.lang.python.linters = { { exe = "flake8" } }
lvim.lang.rust.formatters = { { exe = "rustfmt" } }
lvim.lang.sh.formatters = { { exe = "shfmt" } }
lvim.lang.vim.linters = { { exe = "vint" } }
lvim.lang.vue.formatters = { { exe = "prettier" } }
lvim.lang.yaml.formatters = { { exe = "prettier" } }
