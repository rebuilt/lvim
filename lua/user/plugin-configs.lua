local M = {}

M.cursorword = function()
	vim.api.nvim_command("augroup user_plugin_cursorword")
	vim.api.nvim_command("autocmd!")
	vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
	vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
	vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
	vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
	vim.api.nvim_command("augroup END")
end

M.bfq = function()
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
end

M.diffview = function()
	-- Lua
	local cb = require("diffview.config").diffview_callback

	require("diffview").setup({
		diff_binaries = false, -- Show diffs for binaries
		file_panel = {
			width = 35,
			use_icons = true, -- Requires nvim-web-devicons
		},
		key_bindings = {
			disable_defaults = false, -- Disable the default key bindings
			-- The `view` bindings are active in the diff buffers, only when the current
			-- tabpage is a Diffview.
			view = {
				["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
				["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
				["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
				["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
			},
			file_panel = {
				["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
				["<down>"] = cb("next_entry"),
				["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
				["<up>"] = cb("prev_entry"),
				["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
				["o"] = cb("select_entry"),
				["<2-LeftMouse>"] = cb("select_entry"),
				["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
				["S"] = cb("stage_all"), -- Stage all entries.
				["U"] = cb("unstage_all"), -- Unstage all entries.
				["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
				["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
				["<tab>"] = cb("select_next_entry"),
				["<s-tab>"] = cb("select_prev_entry"),
				["<leader>e"] = cb("focus_files"),
				["<leader>b"] = cb("toggle_files"),
			},
		},
	})
end

M.minimap = function()
	vim.cmd("let g:minimap_width = 10")
	vim.cmd("let g:minimap_auto_start = 0")
	vim.cmd("let g:minimap_auto_start_win_enter = 0")
end

M.autotag = function()
	require("nvim-treesitter.configs").setup({
		autotag = {
			enable = true,
		},
	})
end

M.text_objects = function()
	require("nvim-treesitter.configs").setup({
		textobjects = {
			move = {
				enable = true,
				set_jumps = false, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			select = {
				enable = true,

				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",

					-- Or you can define your own textobjects like this
					-- ["iF"] = {
					-- 	python = "(function_definition) @function",
					-- 	cpp = "(function_definition) @function",
					-- 	c = "(function_definition) @function",
					-- 	java = "(method_declaration) @function",
					-- },
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>x"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>X"] = "@parameter.inner",
				},
			},
			lsp_interop = {
				enable = true,
				border = "none",
				-- peek_definition_code = {
				-- 	["df"] = "@function.outer",
				-- 	["dF"] = "@class.outer",
				-- },
			},
		},
	})
end

return M
