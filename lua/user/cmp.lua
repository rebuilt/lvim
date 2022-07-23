local M = {}

M.setup = function()
  -- Add signature help to cmp completion
  table.insert(lvim.builtin.cmp.sources, 1, { name = "nvim_lsp_signature_help" })
  -- Add copilot to cmp completion
  table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
  lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"

  -- npm install -g emmet-ls
  table.insert(lvim.builtin.cmp.sources, { name = "emmet" })
  lvim.builtin.cmp.formatting.source_names["emmet"] = "(Emmet)"

  table.insert(lvim.builtin.cmp.sources, { name = "emoji" })
  lvim.builtin.cmp.formatting.source_names["emoji"] = "(Emoji)"

  table.insert(lvim.builtin.cmp.sources, { name = "nvim_lsp_signature_help" })
  lvim.builtin.cmp.formatting.source_names["nvim_lsp_signature_help"] = "(Signature)"
end

return M
