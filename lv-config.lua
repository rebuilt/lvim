lvim.format_on_save = true
lvim.lint_on_save = true
vim.cmd("set timeoutlen=1000")
vim.cmd("set number")
vim.cmd("set relativenumber")
lvim.builtin.treesitter.indent = { enable = false }
vim.cmd("set hlsearch")

-- start plugins
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

local status_ok, error = pcall(vim.cmd, "luafile ~/.config/lvim/plugins.lua")

if not status_ok then
  print "something is wrong with your lv-config"
  print(error)
end
-- end plugins
-- =========================================

-- start keybindings
-- =========================================

local status_ok, error = pcall(vim.cmd, "luafile ~/.config/lvim/keybindings.lua")

if not status_ok then
  print "something is wrong with your lv-config"
  print(error)
end
-- end keybindings
-- =========================================

-- whichkey bindings
-- =========================================
local status_ok, error = pcall(vim.cmd, "luafile ~/.config/lvim/whichkey.lua")

if not status_ok then
  print "something is wrong with your lv-config"
  print(error)
end

-- end whichkey bindings
-- =========================================

-- start colorscheme
-- vim.g.onedark_style = "darker"
-- lvim.colorscheme = "onedark"

lvim.colorscheme = "nord"

-- lvim.colorscheme = "spacegray"
-- end colorscheme
