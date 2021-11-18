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
	require("nvim-ts-autotag").setup({
			filetypes = { "html", "eruby", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
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

M.catppuccino = function()
	local catppuccino = require("catppuccino")
	catppuccino.setup({
		colorscheme = "dark_catppuccino",
		transparency = false,
		term_colors = false,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = false,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = false,
			telescope = false,
			nvimtree = {
				enabled = false,
				show_root = false,
			},
			which_key = false,
			indent_blankline = {
				enabled = false,
				colored_indent_levels = false,
			},
			dashboard = false,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = false,
			markdown = false,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
		},
	})
end
M.lsp_signature = function()
  local cfg = {
    bind = true,
    doc_lines = 10,
    floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
    floating_window_above_cur_line = true,
    fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    -- hint_prefix = "🐼 ", -- Panda for parameter
    hint_prefix = " ",
    hint_scheme = "String",
    -- use_lspsaga = false, -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
    -- to view the hiding contents
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
      border = "single", -- double, single, shadow, none
    },
    -- transpancy = 80,
    -- extra_trigger_chars = { "(", "," }, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
    debug = false, -- set to true to enable debug logging
    log_path = "debug_log_file_path", -- debug log path
    -- padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
    shadow_blend = 36, -- if you using shadow as border use this set the opacity
    shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  }
  require("lsp_signature").setup(cfg)
end

return M
