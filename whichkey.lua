lvim.builtin.which_key.mappings = {
	["c"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
	["e"] = { "<cmd>lua require'core.nvimtree'.toggle_tree()<CR>", "Explorer" },
	["h"] = { '<cmd>let @/=""<CR>', "No Highlight" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		r = { "<cmd>lua require('lv-utils').reload_lv_config()<cr>", "Reload" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		i = { "<cmd>LspInfo<cr>", "Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>silent lua require('lint').try_lint()<cr>", "Lint" },
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},

	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		p = {
			"<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
			"Colorscheme with Preview",
		},
	},

	T = {
		name = "Treesitter",
		i = { ":TSConfigInfo<cr>", "Info" },
	},

	f = {
		name = "Find",
		b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		c = { "<cmd>Telescope git_commits<cr>", "Commits" },
		d = { "<cmd>Telescope dotfiles path=" .. os.getenv("HOME") .. "/.dotfiles<cr>", "Neovim config" },
		f = { "<cmd>Telescope find_files find_command=rg,--hidden,--files prompt_prefix=🔍<cr>", "File" },
		g = { "<cmd>Telescope git_files<cr>", "Git files" },
		j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
		q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
		s = { "<cmd>Telescope gosource<cr>", "Go Source" },
		t = { "<cmd>Telescope help_tags<cr>", "Tags" },
		w = { "<cmd>Telescope live_grep<cr>", "Word" },
	},
}
