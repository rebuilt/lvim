local M = {}

M.setup = function()
	local config = require("user.plugin-configs")
	lvim.plugins = {
		{
			"itchyny/vim-cursorword",
			event = { "BufEnter", "BufNewFile" },
			config = config.cursorword,
		},
		{
			"rcarriga/vim-ultest",
			requires = { "vim-test/vim-test" },
			run = ":UpdateRemotePlugins",
			config = function()
				vim.cmd("let g:ultest_use_pty = 1")
			end,
		},
		{
			"aca/emmet-ls",
			ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
			config = config.emmet,
		},
		{
			"simrat39/symbols-outline.nvim",
			cmd = "SymbolsOutline",
		},
		{
			"junegunn/vim-easy-align",
			setup = function()
				vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = false, silent = true })
			end,
			keys = "<Plug>(EasyAlign)",
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			config = config.text_objects,
		},
		{ "nvim-lua/lsp-status.nvim" },
		-- { "tpope/vim-commentary", keys = "g" },
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
		},
		{
			"ray-x/lsp_signature.nvim",
		},
		{ "unblevable/quick-scope", event = { "BufEnter", "BufNewFile" } },
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
			config = config.bqf,
		},
		{
			"tpope/vim-bundler",
			cmd = { "Bundler", "Bopen", "Bsplit", "Btabedit" },
		},
		-- yay -S glow
		-- {
		-- 	"npxbr/glow.nvim",
		-- 	ft = { "markdown" },
		-- 	-- run = "yay -S glow"
		-- },
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
		-- {
		-- 	"wfxr/minimap.vim",
		-- 	run = "cargo install --locked code-minimap",
		-- 	cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
		-- 	config = config.minimap,
		-- },
		{
			"sindrets/diffview.nvim",
			cmd = { "DiffviewOpen", "DiffViewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
			config = config.diffview,
		},
		{
			"windwp/nvim-ts-autotag",
			event = "InsertEnter",
			ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
			config = config.autotag,
		},
		{
			"navarasu/onedark.nvim",
			config = function()
				require("onedark").setup()
			end,
		},
		{
			"tweekmonster/startuptime.vim",
			cmd = "StartupTime",
		},
		{ "mattn/emmet-vim", ft = { "html", "css", "eruby", "javascript" } },
	}
end

return M
