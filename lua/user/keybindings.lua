local M = {}

M.setup = function()
	-- ========================================
	-- keymappings

	-- change default lsp keybindings
	-- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap(
	-- 	"n",
	-- 	"gz",
	-- 	"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>",
	-- 	{ noremap = true, silent = true }
	-- )

	-- Run macro bound to q with Q
	vim.api.nvim_set_keymap("n", "Q", "@q", { noremap = true, silent = true })

	-- use gx and gy because it doesn't override any of the built in g<character> commands
	vim.cmd("nnoremap <silent> gx <cmd>lua require'lsp.peek'.Peek('definition')<CR>")
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

	-- close a buffer
	vim.api.nvim_set_keymap("n", "<S-x>", "<cmd>BufferClose!<CR>", { noremap = true, silent = true })

	-- Hitting escape also clears spelling and search highlights
	vim.api.nvim_set_keymap("n", "<ESC>", ":nohls |:set norelativenumber | :setlocal nospell<ESC>", { noremap = true, silent = true })


	-- When you search, center the result and open any folds
	vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })

	-- When you search backwards, center the result and open any folds
	vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

	-- Keep the cursor in the same place when joining lines
	vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })

	vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })

	-- If a movement is greater than 15 lines, add it to the jump list
	vim.api.nvim_set_keymap(
		"n",
		"k",
		[[(v:count > 15 ? "m'" . v:count : "") . 'k']],
		{ noremap = true, silent = true, expr = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"j",
		[[(v:count > 15 ? "m'" . v:count : "") . 'j']],
		{ noremap = true, silent = true, expr = true }
	)

	-- Yank from the current position to the end of the line
	vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })

	-- Yank and paste to clipboard
	vim.api.nvim_set_keymap("n", "y", '"+y', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "Y", '"+y$', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "p", '"+p', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "P", '"+P', { noremap = true, silent = true })

	-- Reset the 'L' and 'H' navigation keys to default
	lvim.keys.normal_mode["<S-l>"] = nil
	lvim.keys.normal_mode["<S-h>"] = nil
	-- lvim.keys.normal_mode["<S-h>"] = "H"

	-- Navigate to next buffer
	vim.api.nvim_set_keymap("n", "<A-l>", ":BufferNext<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<A-h>", ":BufferPrevious<CR>", { noremap = true, silent = true })


	-- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs + 1] = { "lazydocker", "tl", "Lazydocker" }

	M.bind_typescript_keybinds()
end

M.bind_typescript_keybinds = function()
	-- better keybindings for ts and tsx files
	local langs = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
	local ftype = vim.bo.filetype
	if vim.tbl_contains(langs, ftype) then
		vim.api.nvim_set_keymap("n", "gA", "<cmd>TSLspImportAll<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "gr", "<cmd>TSLspRenameFile<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "gS", "<cmd>TSLspOrganize<CR>", { noremap = true, silent = true })
	end
end

return M
