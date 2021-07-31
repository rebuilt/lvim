lvim.plugins = {
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
	-- {
	-- 	"machakann/vim-sandwich",
	-- 	keys = { "sa", "sd", "sr", "sdb", "srb" },
	-- },
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
		-- ft = { "fugitive" },
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
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	-- {
	-- 	"kdheepak/lazygit.nvim",
	-- 	cmd = { "LazyGit" },
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- },
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup()
		end,
	},
	-- {
	-- 	"arcticicestudio/nord-vim",
	-- },
	-- { "folke/tokyonight.nvim" },
	{
		"tweekmonster/startuptime.vim",
		cmd = "StartupTime",
	},
	{ "mattn/emmet-vim", ft = { "html", "css", "eruby", "javascript" } },
	-- {
	-- 	"ray-x/navigator.lua",
	-- 	requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
	-- 	config = function()
	-- 		require("navigator").setup()
	-- 	end,
	-- },

	{ "jbyuki/one-small-step-for-vimkind" },
}

-- Extended configurations

lvim.builtin.telescope.on_config_done = function(module)
	module.load_extension("fzy_native")
end

lvim.builtin.autopairs.on_config_done = function(module)
	local endwise = require("nvim-autopairs.ts-rule").endwise
	-- local npairs = require("nvim-autopairs")
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

lvim.lsp.on_attach_callback = function(client, bufnr)
	require("lsp_signature").on_attach()
end
