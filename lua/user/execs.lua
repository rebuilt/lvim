local M = {}

M.add_bindings = function(bindings)
	lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs + 1] = bindings
end

M.setup = function()
	lvim.builtin.terminal.close_on_exit = false
	M.add_bindings({ "ls", "z", "LazyGit" })
	M.add_bindings({
		"python " .. vim.fn.expand("%"),
		"r",
		"Run " .. vim.fn.expand("%"),
	})
end

return M
