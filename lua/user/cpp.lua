local M = {}
M.bind_cpp_keys = function()
	print("loaded cpp bindings")
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.api.nvim_buf_get_option(buf, "filetype")
	if ft == "c" or ft == "cpp" then
		vim.cmd("nmap <buffer> <leader>lh <Cmd>ClangdSwitchSourceHeader<CR>")
	end
end
