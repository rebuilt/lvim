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

return M
