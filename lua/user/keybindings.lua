local M = {}

M.setup = function()
	-- ========================================
	-- keymappings

	-- lvim.lsp.default_keybinds = nil
	vim.cmd('nnoremap <silent> <leader>y "+y')
	vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
	vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
	vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
	vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
	vim.cmd(
		"nnoremap <silent> gl <cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>"
	)
	--
	-- 	-- use gx and gy because it doesn't override any of the built in g<character> commands
	vim.cmd("nnoremap <silent> gx <cmd>lua require'lsp'.PeekDefinition()<CR>")
	vim.cmd("map <silent> gy :lua vim.lsp.buf.hover()<CR>")
	vim.cmd(
		"nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<CR>"
	)
	vim.cmd(
		"nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<CR>"
	)
	vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

	-- F12 toggles relativenumber
	vim.api.nvim_set_keymap("n", "<F12>", ":set relativenumber!<CR>", { noremap = true, silent = true })

	-- gb triggers Go-To-Buffer
	vim.api.nvim_set_keymap("n", "gb", "<cmd>BufferPick<CR>", { noremap = true, silent = true })

	-- run a test
	vim.api.nvim_set_keymap("n", "<F6>", ":!yarn test<CR>", { noremap = true, silent = true })

	-- format with prettier
	-- vim.api.nvim_set_keymap("n", "<F7>", ":!prettier --stdin-filepath % | e!<cr>", { noremap = true, silent = true })

	-- save a file every time you exit insert mode if updates were made
	-- vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>:up<CR>", { noremap = true, silent = true })

	-- close a buffer
	vim.api.nvim_set_keymap("n", "<S-x>", "<cmd>BufferClose!<CR>", { noremap = true, silent = true })

	-- Hitting escape also clears spelling and search highlights
	vim.api.nvim_set_keymap("n", "<ESC>", ":nohls | :setlocal nospell<ESC>", { noremap = true, silent = true })

	-- Yank from the current position to the end of the line
	vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })

	-- When you search, center the result and open any folds
	vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })

	-- When you search backwards, center the result and open any folds
	vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

	-- Keep the cursor in the same place when joining lines
	vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })

	vim.api.nvim_set_keymap(
		"n",
		"k",
		[[(v:count > 5 ? "m'" . v:count : "") . 'k']],
		{ noremap = true, silent = true, expr = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"j",
		[[(v:count > 5 ? "m'" . v:count : "") . 'j']],
		{ noremap = true, silent = true, expr = true }
	)

	vim.api.nvim_set_keymap("n", "y", '"+y', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "Y", '"+yy', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "p", '"+p', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "P", '"+P', { noremap = true, silent = true })
end

return M
