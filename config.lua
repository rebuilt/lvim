-- =========================================
-- lvim.colorscheme = "onedarker"
-- lvim.log.level = "debug"

lvim.format_on_save = true
-- lvim.lsp.installer.setup.automatic_installation = true

vim.o.termguicolors = true
lvim.colorscheme = "onedarker"
vim.opt.timeoutlen = 1000
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
vim.opt.guifont = "FiraCode Nerd Font:h12"

lvim.transparent_window = true

lvim.line_wrap_cursor_movement = false

lvim.builtin.alpha.active = false
lvim.builtin.comment.active = false
lvim.builtin.terminal.active = true
lvim.builtin.project.active = true
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.setup.open_on_setup = false
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
-- lvim.builtin.treesitter.textsubjects.enable = true
-- lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
-- lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart"
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


-- vim.cmd("let g:copilot_no_tab_map = v:true")
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Go to Definiton" }

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "solargraph" })
require("lspconfig").solargraph.setup({})
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "html" })
require("lspconfig").html.setup({})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "emmet_ls" })
require("lvim.lsp.manager").setup("emmet_ls", {})

-- local lspconfig = require('lspconfig')
-- local configs = require('lspconfig/configs')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.emmet_ls.setup({
--   -- on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   }
-- })

-- require("lspconfig").solargraph.setup(
--   {
--     cmd = { "solargraph", "stdio" },
--     settings = {
--       solargraph = {
--         diagnostics = true,
--       },
--     },
--   }
-- )


require("user.dap").setup()
-- Additional textobjects
require("user.textobjects").setup()

lvim.lsp.null_ls.setup = {
  log = {
    level = "info",
  },
}

-- local cmp = require('cmp')
-- lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm({ select = true })

-- lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm {
--   behavior = cmp.ConfirmBehavior.Replace,
--   select = false,
-- }
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

lvim.builtin.treesitter.indent = {
  disable = { " go", "ruby", "eruby" }
}
lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git" }

lvim.builtin.treesitter.highlight.disable = {}


local cmp = require('cmp')

lvim.builtin.cmp.mapping['<C-y>'] = cmp.mapping(function(fallback) fallback() end)
vim.cmd [[
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
]]
