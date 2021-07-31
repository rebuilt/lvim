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

local load = function(filename)
	local status_ok, module = pcall(vim.cmd, "luafile ~/.config/lvim/lua/" .. filename)
	-- local status_ok, module = pcall(require, module_name)

	if not status_ok then
		print("something is wrong with your lv-config")
		print(error)
	end
end

load("plugins.lua")

-- general keybindings
-- =========================================

load("keybindings.lua")

-- whichkey bindings
-- =========================================
load("whichkey.lua")

-- language
-- lvim.lang.javascript.formatter.exe = "prettier"

-- colorscheme
vim.g.onedark_style = "darker"
lvim.colorscheme = "onedark"

-- lvim.builtin.on_config_done = function()
-- 	local dap = require("dap")
-- 	dap.configurations.lua = {
-- 		{
-- 			type = "nlua",
-- 			request = "attach",
-- 			name = "Attach to running Neovim instance",
-- 			host = function()
-- 				local value = vim.fn.input("Host [127.0.0.1]: ")
-- 				if value ~= "" then
-- 					return value
-- 				end
-- 				return "127.0.0.1"
-- 			end,
-- 			port = function()
-- 				local val = tonumber(vim.fn.input("Port: "))
-- 				assert(val, "9000")
-- 				return val
-- 			end,
-- 		},
-- 	}
--
-- 	dap.adapters.nlua = function(callback, config)
-- 		callback({ type = "server", host = config.host, port = config.port })
-- 	end
-- end
lvim.builtin.galaxyline.on_config_done = function(module)
	local section = module.section

	-- print the entire table
	-- print(vim.inspect(gls.right))
	-- type :messages to read the printed output

	-- print an element at a given index.  Lua table indexes start at 1
	-- print(vim.inspect(gls.right[1]))

	-- remove the sections you don't want.  The remove function takes an index.  Leaving off the index will remove the last item from the table.
	table.remove(section.right, 1)
	table.remove(section.right, 1)
	table.remove(section.right, 1)
	table.remove(section.right, 1)
	table.remove(section.right, 1)
	table.remove(section.right, 1)
	table.remove(section.right, 1)
	table.remove(section.right, 1)

	-- This will remove the entire right side.  You can add in the sections you want
	-- gls.right = {}
end
