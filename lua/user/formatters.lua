local M = {}

M.setup = function()
  -- local null_ls = require("null-ls")

  -- local sources = {

  -- 	-- Formatters
  -- 	null_ls.builtins.formatting.eslint_d,
  -- 	null_ls.builtins.formatting.fixjson,
  -- 	null_ls.builtins.formatting.stylua,
  -- 	null_ls.builtins.formatting.rubocop,

  -- 	-- Linters
  -- 	null_ls.builtins.diagnostics.eslint_d,
  -- 	null_ls.builtins.diagnostics.rubocop,
  -- 	null_ls.builtins.diagnostics.erb_lint,
  -- 	null_ls.builtins.diagnostics.shellcheck,
  -- 	null_ls.builtins.diagnostics.markdownlint,
  -- 	null_ls.builtins.diagnostics.write_good,
  -- 	null_ls.builtins.diagnostics.erb_lint,
  -- }

  -- -- Enable the formatters and linters.
  -- null_ls.register({ sources = sources })

  -- local formatters = require("lvim.lsp.null-ls.formatters")
  -- formatters.setup({
  --   { exe = "black" },
  --   { exe = "stylua" },
  --   { exe = "prettierd" },
  --   { exe = "markdownlint" },
  --   { exe = "codespell" },
  --   { exe = "shfmt" },
  --   { exe = "rustfmt" },
  --   { exe = "pg_format" },
  --   { exe = "eslint_d" },
  --   { exe = "rubocop" },
  -- })

  -- local null_ls = require("null-ls")
  -- local sources = {
  --   null_ls.builtins.diagnostics.rubocop,
  --   null_ls.builtins.diagnostics.erb_lint,
  -- }
  -- null_ls.register({ sources = sources })

  -- local formatters = require("lvim.lsp.null-ls.formatters")
  -- formatters.setup({
  --   { exe = "rubocop" },
  -- })

  local linters = require("lvim.lsp.null-ls.linters")
  linters.setup({
    { exe = "rubocop" },
    { exe = "erb_lint" },
  })
end

return M
