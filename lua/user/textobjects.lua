local M = {}

M.setup = function()
  lvim.builtin.treesitter.on_config_done = function()
    require 'nvim-treesitter.configs'.setup {
      extobjects = {
        swap = {
          enable = true,
          swap_next = {
            ["<leader>Sp"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>SP"] = "@parameter.inner",
          },
        },

        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["aC"] = "@class.outer",
            ["iC"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["ac"] = "@comment.outer",
            ["ic"] = "@comment.inner",
            ["aP"] = "@parameter.outer",
            ["iP"] = "@parameter.inner",
          },
        },

        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },

        lsp_interop = {
          enable = true,
          border = 'none',
          peek_definition_code = {
            ["<leader>lpD"] = "@function.outer",
            ["<leader>lpT"] = "@class.outer",
          },
        },
      },
    }
  end
end

return M
