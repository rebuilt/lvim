lvim.format_on_save = true

lvim.colorscheme = "onedarker"
-- vim.o.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.inccommand = "split"
vim.opt.scrolloff = 0
vim.opt.smartindent = false
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.shiftround = true
vim.opt.guifont = "FiraCode Nerd Font:h12"
vim.opt.cmdheight = 1
vim.opt.updatetime = 50

lvim.transparent_window = true
lvim.line_wrap_cursor_movement = false
lvim.builtin.alpha.active = false
lvim.builtin.notify.active = false
lvim.builtin.lir.active = false
lvim.builtin.comment.active = false
lvim.builtin.terminal.active = true
lvim.builtin.project.active = true
lvim.builtin.indentlines.active = false
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.ensure_installed = { "ruby" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.nvimtree.setup.open_on_setup = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
-- lvim.builtin.treesitter.textsubjects.enable = true
-- lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
-- lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"
lvim.lsp.document_highlight = true

lvim.lsp.diagnostics.virtual_text = true

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

-- global functions
require("user.functions")

-- Can not be placed into the config method of the plugins.
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
