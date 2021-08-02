local M = {}

M.add_bindings = function(bindings)
	lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs + 1] = bindings
end

M.bind_lua = function()
	M.add_bindings({ { "ls", "z", "LazyGit" } })
end

return M
