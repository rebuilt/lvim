local M = {}
lvim.leader = "space"
M.setup = function()
	lvim.builtin.which_key.mappings = {
		["a"] = { "<cmd>:e ~/.config/lvim/config.lua<cr>", "Settings file" },
		["e"] = { "<cmd>lua require'core.nvimtree'.toggle_tree()<CR>", "Explorer" },

		p = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			r = { "<cmd>lua require('utils').reload_lv_config()<cr>", "Reload" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},

		g = {
			name = "Git",
			C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
			R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
			k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
			l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
			m = { "<cmd>Telescope git_status<cr>", "Modified files" },
			p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
			r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
			s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
			u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		},

		t = {
			name = "Fugitive",
			d = { "<cmd>Git diff<cr>", "Diff" },
			m = { "<cmd>Git mergetool<cr>", "Mergetool" },
			t = { "<cmd>Gstatus<cr>", "Status" },
			s = { "<cmd>Gdiffsplit<cr>", "Diffsplit" },
			r = { "<cmd>Gread<cr>", "Read" },
			b = { "<cmd>Gbrowse<cr>", "Browse" },
		},

		l = {
			name = "LSP",
			S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
			f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
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
			w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
		},

		s = {
			name = "Search",
			C = { "<cmd>Telescope commands<cr>", "Commands" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			p = {
				"<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
				"Colorscheme with Preview",
			},
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			t = { "<cmd>Telescope live_grep<cr>", "Text" },
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
			m = { "<cmd>Telescope git_status<cr>", "Modified Files" },
			q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
			s = { "<cmd>Telescope gosource<cr>", "Go Source" },
			t = { "<cmd>Telescope help_tags<cr>", "Tags" },
			w = { "<cmd>Telescope live_grep<cr>", "Word" },
		},
		m = {
			name = "Minimap",

			m = { "<cmd>MinimapToggle<cr>", "Minimap" },
			-- { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
		},
	}
end

return M
