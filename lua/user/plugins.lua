local M = {}

M.setup = function()
	local config = require("user.plugin-configs")
	lvim.plugins = {
		-- {
		-- 	"lervag/vimtex",
		-- 	config = function()
		-- 		vim.cmd("call vimtex#init()")
		-- 	end,
		-- },
		{
			"ibhagwan/fzf-lua",
			requires = {
				"vijaymarupudi/nvim-fzf",
				"kyazdani42/nvim-web-devicons",
			},
			config = function()
				require("fzf-lua").setup({
					default_previewer = "bat",
					fzf_bin = "sk",
					grep = {
						cmd = "rg --vimgrep",
					},
				})
				vim.cmd([[ nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR> ]])
				-- vim.cmd([[ nnoremap <leader>st <cmd>lua require('fzf-lua').live_grep()<CR> ]])
			end,
		},
		{ "junegunn/fzf", run = "./install --bin" },
		{
			"phaazon/hop.nvim",
			as = "hop",
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		},
		{
			"aca/emmet-ls",
			ft = {
				"html",
				"css",
			},
		},
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup({ "*" }, {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				})
			end,
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
		-- { "nvim-lua/lsp-status.nvim" },
		-- { "tpope/vim-commentary", keys = "g" },
		{
			"tpope/vim-surround",
			keys = { "c", "d", "y" },
		},
		{
			"tpope/vim-dispatch",
			cmd = { "Dispatch" },
		},
		-- {
		-- 	"JoosepAlviste/nvim-ts-context-commentstring",
		-- 	event = "BufRead",
		-- },
		{
			"tpope/vim-commentary",
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
		{
			"mattn/emmet-vim",
			ft = { "html", "css", "eruby", "javascript" },
		},
		-- {
		-- 	"dense-analysis/ale",
		-- 	config = function()
		-- 		vim.cmd([[
		-- let g:ale_disable_lsp = 1
		-- let g:ale_lint_on_insert_leave=1
		-- ]])
		-- 	end,
		-- },
	}
end

return M
