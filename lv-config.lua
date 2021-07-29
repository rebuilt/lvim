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

-- plugins
-- =========================================

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.auto_open = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"
lvim.lang.lua.formatter.exe = "stylua"
lvim.builtin.terminal.active = true
lvim.lsp.default_keybinds = false

-- lvim.builtin.treesitter.indent = { enable = false }

local load = function(path)
	local status_ok, error = pcall(vim.cmd, path)

	if not status_ok then
		print("something is wrong with your lv-config")
		print(error)
	end
end

load("luafile ~/.config/lvim/plugins.lua")

-- general keybindings
-- =========================================

load("luafile ~/.config/lvim/keybindings.lua")

-- whichkey bindings
-- =========================================
load("luafile ~/.config/lvim/whichkey.lua")

-- language
lvim.lang.javascript.formatter.exe = "prettier"

-- colorscheme
vim.g.onedark_style = "darker"
lvim.colorscheme = "onedark"

lvim.builtin.telescope.extensions = {
	fzy_native = {
		override_generic_sorter = false,
		override_file_sorter = true,
	},
}

lvim.builtin.telescope.on_config_done = function()
	require("telescope").load_extension("fzy_native")
end
