O.format_on_save = false
O.lint_on_save = true
O.completion.autocomplete = true
O.colorscheme = "spacegray"
O.default_options.wrap = true
O.default_options.timeoutlen = 500
-- keymappings
O.keys.leader_key = "space"
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
-- O.keys.normal_mode = {
--   Page down/up
--   {'[d', '<PageUp>'},
--   {']d', '<PageDown>'},
--
--   Navigate buffers
--   {'<Tab>', ':bnext<CR>'},
--   {'<S-Tab>', ':bprevious<CR>'},
-- }
-- if you just want to augment the existing ones then use the utility function
-- require("lv-utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

O.plugin.dashboard.active = false
O.plugin.terminal.active = true
O.plugin.zen.active = false
O.plugin.zen.window.height = 0.90
O.plugin.nvimtree.side = "left"
O.plugin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "maintained"
O.treesitter.highlight.enabled = true

-- javascript
O.lang.tsserver.linter = nil

O.user_plugins = {

	{
		"itchyny/vim-cursorword",
		event = { "BufEnter", "BufNewFile" },
		config = function()
			vim.api.nvim_command("augroup user_plugin_cursorword")
			vim.api.nvim_command("autocmd!")
			vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
			vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
			vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
			vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
			vim.api.nvim_command("augroup END")
		end,
	},
	{
		"tpope/vim-surround",
		keys = { "c", "d", "y" },
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufRead",
	},
	{
		"tpope/vim-repeat",
		keys = { "%." },
	},
	{
		"ray-x/lsp_signature.nvim",
	},
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "QuickFixCmdPre",
	},
	{
		"tpope/vim-bundler",
		cmd = { "Bundler", "Bopen", "Bsplit", "Btabedit" },
	},
	-- yay -S glow
	{
		"npxbr/glow.nvim",
		ft = { "markdown" },
		-- run = "yay -S glow"
	},
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = ":call mkdp#util#install()",
        config = function()
            vim.g.mkdp_auto_start = 1
        end
    },
{
  "nvim-telescope/telescope-fzy-native.nvim",
  run = "make",
},
	{ 'wfxr/minimap.vim',
  run = "cargo install --locked code-minimap",
  cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
config = function ()
vim.cmd ("let g:minimap_width = 10")
vim.cmd ("let g:minimap_auto_start = 0")
vim.cmd ("let g:minimap_auto_start_win_enter = 0")
end
  },

{
  'kdheepak/lazygit.nvim',
  cmd = {"LazyGit"},
  requires = { 'nvim-lua/plenary.nvim' },
}
}
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Leader bindings for WhichKey
-- O.user_which_key = {
--   A = {
--     name = "+Custom Leader Keys",
--     a = { "<cmd>echo 'first custom command'<cr>", "Description for a" },
--     b = { "<cmd>echo 'second custom command'<cr>", "Description for b" },
--   },
-- }

O.plugin.telescope.on_config_done = function(module)
  module.load_extension('fzy_native')
end

O.plugin.autopairs.on_config_done = function(module)
	local endwise = require("nvim-autopairs.ts-rule").endwise
	module.add_rules({
		endwise("def", "end", nil, nil),
	})

	module.remove_rule("`")
	local Rule = require("nvim-autopairs.rule")
	module.add_rule(Rule("`", "`", { "lua", "ruby", "javascript" }))
	module.add_rule(Rule("```", "```", "markdown"))
end

O.plugin.which_key.on_config_done = function(module)
	module.register({
		v = {
			name = "view",
			t = {
				":lua search_selected()<CR>",
				"Search Selected Text",
			},
		},
	}, {
		mode = "v",
		prefix = "<leader>",
	})
end
