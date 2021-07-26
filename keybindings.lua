-- ========================================
-- keymappings
lvim.keys.leader_key = "space"
lvim.lsp.default_keybinds = nil

vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.api.nvim_set_keymap(
	"n",
	"gl",
	'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = "single" })<CR>',
	{ noremap = true, silent = true }
)

vim.cmd("nnoremap <silent> gx <cmd>lua require'lsp'.PeekDefinition()<CR>")
vim.cmd("map <silent> gy :lua vim.lsp.buf.hover()<CR>")
vim.cmd("nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<CR>")
vim.cmd("nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<CR>")
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

vim.api.nvim_set_keymap("n", "<F12>", ":set relativenumber!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<ESC>", ":nohls | :setlocal nospell<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gb", "<cmd>BufferPick<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F6>", ":!yarn test<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F7>", ":!prettier --stdin-filepath % | e!<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<S-x>", "<cmd>BufferClose!<CR>", { noremap = true, silent = true })
-- end keymappings
-- =========================================
