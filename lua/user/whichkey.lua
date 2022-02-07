local M = {}
lvim.leader = "space"
M.setup = function()
	lvim.builtin.which_key.mappings["a"] = { "<cmd>:e ~/.config/lvim/config.lua<cr>", "Settings file" }
	lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Outline" }
	lvim.builtin.which_key.mappings["m"] = { "<cmd>lua require('harpoon.mark').toggle_file()<cr>", "toggle mark" }
	lvim.builtin.which_key.mappings["f"] = {
		name = "Find",
		-- b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		-- c = { "<cmd>Telescope git_commits<cr>", "Commits" },
		-- d = { "<cmd>Telescope dotfiles path=" .. os.getenv("HOME") .. "/.dotfiles<cr>", "Neovim config" },
		-- f = { "<cmd>Telescope find_files<cr>", "File" },
		-- g = { "<cmd>Telescope git_files<cr>", "Git files" },
		-- j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
		-- m = { "<cmd>Telescope git_status<cr>", "Modified Files" },
		-- q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
		-- s = { "<cmd>Telescope gosource<cr>", "Go Source" },
		-- t = { "<cmd>Telescope help_tags<cr>", "Tags" },
		-- w = { "<cmd>Telescope live_grep<cr>", "Search word" },
		f = { "<cmd>lua require('fzf-lua').files()<cr>", "Find files" },
		w = { "<cmd>lua require('fzf-lua').live_grep()<cr>", "Search for word" },
	}
	lvim.builtin.which_key.mappings["t"] = {
		name = "Test",
		f = { "<cmd>TestFile<cr>", "Test File" },
		l = { "<cmd>TestLast<cr>", "Test Last" },
		n = { "<cmd>TestNearest<cr>", "Test Nearest" },
		s = { "<cmd>TestSuite<cr>", "Test Suite" },
		v = { "<cmd>TestVisit<cr>", "Test Visit" },
	}

	lvim.builtin.which_key.mappings["s"] = {
		s = { "<cmd>lua require('fzf-lua').files()<cr>", "Find files" },
		a = { "<cmd>lua require('fzf-lua').grep_last()<cr>", "Search again" },
		c = { "<cmd>lua require('fzf-lua').grep_cword()<cr>", "Current word" },
		C = { "<cmd>lua require('fzf-lua').grepcWORD()<cr>", "Current WORD" },
		v = { "<cmd>lua require('fzf-lua').grep_visual()<cr>", "Visual selection" },
		b = { "<cmd>lua require('fzf-lua').grep_curbuf()<cr>", "Current buffer" },
		B = { "<cmd>lua require('fzf-lua').builtin()<cr>", "Builtin" },
		r = { "<cmd>lua require('fzf-lua').registers()<cr>", "Registers" },
		w = { "<cmd>Telescope live_grep<cr>", "Search word" },
	}

	lvim.builtin.which_key.mappings["r"] = {
		name = "rails",
		e = {
			name = "edit",
			v = { "<cmd>Eview index<cr>", "view" },
			c = { "<cmd>Econtroller<cr>", "controller" },
			m = { "<cmd>Emodel<cr>", "model" },
			f = { "<cmd>Rfactory<cr>", "Edit factory" },
		},
		s = {
			name = "split",
			v = { "<cmd>Sview<cr>", "view" },
			c = { "<cmd>Scontroller<cr>", "controller" },
			m = { "<cmd>Smodel<cr>", "model" },
			f = { "<cmd>RSfactory<cr>", "Edit factory" },
		},
		v = {
			name = "vsplit",
			v = { "<cmd>Vview<cr>", "view" },
			c = { "<cmd>Vcontroller<cr>", "controller" },
			m = { "<cmd>Vmodel<cr>", "model" },
			f = { "<cmd>RVfactory<cr>", "Edit factory" },
		},
		t = {
			name = "tabedit",
			v = { "<cmd>Tview<cr>", "view" },
			c = { "<cmd>Tcontroller<cr>", "controller" },
			m = { "<cmd>Tmodel<cr>", "model" },
			f = { "<cmd>RTfactory<cr>", "Edit factory" },
		},
		r = { "<cmd>Rails<cr>", "Rails" },
		G = { "<cmd>Generate<cr>", "Generate" },
		R = { "<cmd>Runner<cr>", "Runner" },
		E = { "<cmd>Extract<cr>", "Extract" },
	}

	lvim.builtin.which_key.mappings["h"] = {
    name = "harpoon",
    m = {"<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark"},
    g = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Go"},
    c = {"<cmd>lua require('harpoon.mark').clear_all()<cr>", "Clear all"},
    d = {"<cmd>lua require('harpoon.mark').rm_file()<cr>", "Delete mark"},
  }

	lvim.builtin.which_key.mappings["/"] = nil
	-- lvim.builtin.which_key.mappings["w"] = nil
	lvim.builtin.which_key.mappings["q"] = nil
	-- lvim.builtin.which_key.mappings["h"] = nil
end

return M
