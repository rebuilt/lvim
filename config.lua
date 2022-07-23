--require('dap-ruby').setup() General settings for neovim
-- =========================================
-- lvim.log.level = "debug"

lvim.format_on_save = true
-- lvim.format_on_save.timeout = 0

lvim.lsp.automatic_servers_installation = true
vim.o.termguicolors = true
lvim.colorscheme = "onedarker"
vim.opt.timeoutlen = 1000
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.inccommand = "split"
vim.opt.scrolloff = 0
vim.opt.smartindent = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.shiftround = true
vim.opt.guifont = "FiraCode Nerd Font:h13"
vim.cmd("set clipboard+=unnamedplus")

lvim.line_wrap_cursor_movement = false

lvim.builtin.dap.active = false
lvim.builtin.alpha.active = false
lvim.builtin.comment.active = false
lvim.builtin.terminal.active = true
lvim.builtin.project.active = true
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.setup.open_on_setup = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"
-- lvim.builtin.telescope.active = false
lvim.lsp.document_highlight = true

lvim.lsp.diagnostics.virtual_text = true

-- plugins
-- =========================================
require("user.plugins").setup()

-- general keybindings
-- =========================================
require("user.keybindings").setup()

-- whichkey bindings
-- =========================================
require("user.whichkey").setup()

-- callbacks
require("user.callbacks").setup()

-- additional lsp configs
require("user.lsp").config()

require("user.autocommands").setup()

-- formatters
require("user.formatters").setup()

-- global functions
require("user.functions")

-- additional cmp sources
require("user.cmp").setup()


-- require("telescope").setup({
-- 	defaults = {
-- 		file_ignore_patterns = { "data" },
-- 	},
-- 	-- extensions = {
-- 	-- 	fzf = {
-- 	-- 		fuzzy = true,
-- 	-- 		override_generic_sorter = true,
-- 	-- 		override_file_sorter = true,
-- 	-- 		case_mode = "smart_case",
-- 	-- 	},
-- 	-- },
-- })

-- lvim.builtin.cmp.mapping["<C-Space>"] = nil
-- vim.cmd("imap <silent><script><expr> <C-Space> copilot#Accept('<CR>') ")
-- vim.cmd("let g:copilot_no_tab_map = v:true")
-- lvim.keys.normal_mode['gr'] = ":Telescope lsp_references<CR>"
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Go to Definiton" }

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "solargraph" })
require("lspconfig").solargraph.setup({
  -- cmd = { "solargraph", "stdio" },
  filetypes = { "ruby", "eruby" },
  init_options = {
    formatting = true,
  },
  settings = {
    solargraph = {
      diagnostics = true
    }
  }
})

lvim.builtin.dap.active = true
-- ruby debugging support
require("dapui").setup()
require('dap-ruby').setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
