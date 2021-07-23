LV.format_on_save = true
LV.lint_on_save = true
LV.completion.autocomplete = true
LV.colorscheme = "spacegray"
vim.cmd(":set timeoutlen=500")
vim.cmd(":set relativenumber")
LV.treesitter.indent = { enable = false }
vim.cmd(":set hlsearch")

-- ========================================
-- keymappings
LV.keys.leader_key = "space"
LV.lsp.default_keybinds = nil

vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.api.nvim_set_keymap(
	"n",
	"gl",
	'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = "single" })<CR>',
	{ noremap = true, silent = true }
)

vim.cmd("nnoremap <silent> gx <cmd>lua require'lsp'.PeekDefinition()<CR>")
vim.cmd("map <silent> gy :lua vim.lsp.buf.hover()<CR>")
vim.cmd("nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = LV.lsp.popup_border}})<CR>")
vim.cmd("nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = LV.lsp.popup_border}})<CR>")
-- scroll down hover doc or scroll in definition preview
-- scroll up hover doc
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

vim.api.nvim_set_keymap("n", "<F12>", ":set relativenumber!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<ESC>", ":nohls | :setlocal nospell<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gb", "<cmd>BufferPick<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F6>", ":!yarn test<CR>", { noremap = true, silent = true })

-- end keymappings
-- =========================================

LV.plugin.dashboard.active = false
LV.plugin.terminal.active = true
LV.plugin.nvimtree.auto_open = 0
LV.plugin.nvimtree.side = "left"
LV.plugin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
LV.treesitter.ensure_installed = "maintained"
LV.treesitter.highlight.enabled = true

-- javascript

LV.plugins = {

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
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
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
		end,
	},
	{
		"nvim-telescope/telescope-fzy-native.nvim",
		run = "make",
	},
	{
		"wfxr/minimap.vim",
		run = "cargo install --locked code-minimap",
		cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
		config = function()
			vim.cmd("let g:minimap_width = 10")
			vim.cmd("let g:minimap_auto_start = 0")
			vim.cmd("let g:minimap_auto_start_win_enter = 0")
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit" },
		requires = { "nvim-lua/plenary.nvim" },
	},
	{
		"windwp/nvim-ts-autotag",
		-- event = "InsertEnter",
		ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
}
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- LV.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Leader bindings for WhichKey
-- LV.user_which_key = {
--   A = {
--     name = "+Custom Leader Keys",
--     a = { "<cmd>echo 'first custom command'<cr>", "Description for a" },
--     b = { "<cmd>echo 'second custom command'<cr>", "Description for b" },
--   },
-- }

LV.plugin.telescope.on_config_done = function(module)
	module.load_extension("fzy_native")
end

LV.plugin.autopairs.on_config_done = function(module)
	local endwise = require("nvim-autopairs.ts-rule").endwise
	module.add_rules({
		endwise("def", "end", nil, nil),
	})
	-- Rule('def%s.+$', 'end', 'ruby')
	--        :use_regex(true)
	--        :end_wise(cond.not_after_regex_check('.'))
	module.remove_rule("`")
	local Rule = require("nvim-autopairs.rule")
	module.add_rule(Rule("`", "`", { "lua", "ruby", "javascript" }))
	module.add_rule(Rule("```", "```", "markdown"))
end

LV.plugin.which_key.on_config_done = function(module)
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

LV.lsp.on_attach_callback = function(client, bufnr)
	require("lsp_signature").on_attach()
end
