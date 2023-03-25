local M = {}

M.setup = function()
  lvim.autocommands = {
    -- { "CursorHold", { pattern = "*", command = "lua vim.lsp.diagnostic.show_line_diagnostics()" } },
    -- { "BufWritePre", { pattern = "*", command = "lua require('user.tidy').tidy_up()" } },
    { "BufEnter", { pattern = "*.erb", command = "set ft=eruby" } },
    -- { "BufWritePre", { pattern = "*.erb", command = "normal gg=G" } },
    -- { "BufWritePost", { pattern = "*.erb", command = "!erblint -a %" } },
  }
end

return M
