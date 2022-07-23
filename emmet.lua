lvim.plugins = {
  {
    "aca/emmet-ls",
    ft = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "css",
      "sass",
      "scss",
      "less",
    },
  },
  {
    "jackieaskins/cmp-emmet",
    run = "npm run release",
  },
}

table.insert(lvim.builtin.cmp.sources, { name = "emmet" })
lvim.builtin.cmp.formatting.source_names["emmet"] = "(Emmet)"
