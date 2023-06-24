local M = {}

M.setup = function()
  local helpers = require("null-ls.helpers")
  local FORMATTING = require("null-ls.methods").internal.FORMATTING
  require("null-ls").register({
    --your custom sources go here
    helpers.make_builtin({
      name = "htmlbeautifier",
      meta = {
        url = "https://github.com/threedaymonk/htmlbeautifier",
        description =
        "A normaliser/beautifier for HTML that also understands embedded Ruby. Ideal for tidying up Rails templates."
      },
      method = FORMATTING,
      filetypes = { "eruby" },
      generator_opts = {
        command = "htmlbeautifier",
        args = {},       -- put any required arguments in this table
        to_stdin = true, -- instructs the command to ingest the file from STDIN (i.e. run the currently open buffer through the linter/formatter)
      },
      factory = helpers.formatter_factory,
    })
  })

  local null_ls = require("null-ls")
  local sources = { null_ls.builtins.formatting.crystal_format }
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

  -- local linters = require("lvim.lsp.null-ls.linters")
  -- linters.setup({
  -- { exe = "rubocop" },
  -- { exe = "erb_lint" },
  -- })
end

return M
