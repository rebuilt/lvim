local M = {}
lvim.leader = "space"
M.setup = function()
	lvim.builtin.which_key.mappings["a"] = { "<cmd>:e ~/.config/lvim/config.lua<cr>", "Settings file" }
	lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Outline" }
	lvim.builtin.which_key.mappings["f"] = {
		name = "Find",
		b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		c = { "<cmd>Telescope git_commits<cr>", "Commits" },
		d = { "<cmd>Telescope dotfiles path=" .. os.getenv("HOME") .. "/.dotfiles<cr>", "Neovim config" },
		f = { "<cmd>Telescope find_files<cr>", "File" },
		g = { "<cmd>Telescope git_files<cr>", "Git files" },
		j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
		m = { "<cmd>Telescope git_status<cr>", "Modified Files" },
		q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
		s = { "<cmd>Telescope gosource<cr>", "Go Source" },
		t = { "<cmd>Telescope help_tags<cr>", "Tags" },
		w = { "<cmd>Telescope live_grep<cr>", "Word" },
	}
	lvim.builtin.which_key.mappings["s"] = {
		s = { "<cmd>lua require('fzf-lua').files()<cr>", "Find files" },
		a = { "<cmd>lua require('fzf-lua').grep_last()<cr>", "Search again" },
		c = { "<cmd>lua require('fzf-lua').grep_cword()<cr>", "Current word" },
		C = { "<cmd>lua require('fzf-lua').grepcWORD()<cr>", "Current WORD" },
		v = { "<cmd>lua require('fzf-lua').grep_visual()<cr>", "Visual selection" },
		b = { "<cmd>lua require('fzf-lua').grep_curbuf()<cr>", "Current buffer" },
		B = { "<cmd>lua require('fzf-lua').builtin()<cr>", "Builtin" },
		w = { "<cmd>lua require('fzf-lua').live_grep()<cr>", "Search for word" },
		r = { "<cmd>lua require('fzf-lua').registers()<cr>", "Registers" },
	}

	lvim.builtin.which_key.mappings["/"] = nil
	-- lvim.builtin.which_key.mappings["w"] = nil
	lvim.builtin.which_key.mappings["q"] = nil
	lvim.builtin.which_key.mappings["h"] = nil
end

return M
