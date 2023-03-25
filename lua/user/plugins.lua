local M = {}

M.setup = function()
  local configs = require("user.plugin-configs")
  lvim.plugins = {
    { "tpope/vim-markdown" },
    {
      'samodostal/image.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim'
      },
    },
    { 'vimwiki/vimwiki' },
    { "cpea2506/relative-toggle.nvim" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    -- { "gelguy/wilder.nvim" },
    -- { 'chipsenkbeil/vimwiki-server.nvim',
    --   version = 'v0.1.0-alpha.5' },
    -- { "rcarriga/nvim-dap-ui" },
    -- { 'chipsenkbeil/vimwiki.nvim' },
    { "suketa/nvim-dap-ruby" },
    { "hrsh7th/cmp-emoji" },
    { "lad/vim-reek" },
    { "nanotee/luv-vimdocs" },
    { "milisims/nvim-luaref" },
    { "duane9/nvim-rg" },
    { "github/copilot.vim" },
    { "hrsh7th/cmp-copilot" },
    -- { "simrat39/rust-tools.nvim" },
    -- {
    --   "zbirenbaum/copilot.lua",
    --   event = { "VimEnter" },
    --   module = "copilot_cmp",
    --   config = function()
    --     vim.defer_fn(function()
    --       require("copilot").setup({
    --         plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
    --       })
    --     end, 100)
    --   end,
    -- },

    -- {
    --   "zbirenbaum/copilot-cmp",
    --   after = { "copilot.lua", "nvim-cmp" },
    -- },
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    },
    {
      "editorconfig/editorconfig-vim",
      config = function()
        vim.cmd([[ let g:EditorConfig_exclude_patterns = ['fugitive://.*'] ]])
        vim.cmd([[ let g:EditorConfig_exec_path = '/usr/bin/editorconfig' ]])
        vim.cmd([[ let g:EditorConfig_core_mode = 'external_command' ]])
      end,
    },
    {
      "mg979/vim-visual-multi",
      config = function()
        vim.cmd([[
                let g:VM_maps = {}
                let g:VM_mouse_mappings = 1
                ]])
      end,
    },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    {
      "vim-test/vim-test",
      cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
      config = function()
        vim.cmd("let test#strategy = 'dispatch'")
      end,
    },
    {
      "rhysd/devdocs.vim",
      cmd = { "DevDocs", "DevDocsAll" },
    },
    {
      "phaazon/hop.nvim",
      name = "hop",
      keys = { "s", "S" },
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
        vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", {})
        vim.api.nvim_set_keymap("n", "S", ":HopPattern<cr>", {})
      end,
    },
    -- {
    --   "norcalli/nvim-colorizer.lua",
    --   config = function()
    --     require("colorizer").setup({ "css", "scss", "html", "javascript", "eruby" }, {
    --       RGB = true, -- #RGB hex codes
    --       RRGGBB = true, -- #RRGGBB hex codes
    --       RRGGBBAA = true, -- #RRGGBBAA hex codes
    --       rgb_fn = true, -- CSS rgb() and rgba() functions
    --       hsl_fn = true, -- CSS hsl() and hsla() functions
    --       css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    --       css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    --     })
    --   end,
    -- },
    {
      "junegunn/vim-easy-align",
      init = function()
        vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {
          noremap = false,
          silent = true,
        })
      end,
    },
    -- {
    -- 	"machakann/vim-sandwich",
    -- 	config = function()
    -- 		vim.cmd("runtime macros/sandwich/keymap/surround.vim")
    -- 	end,
    -- },
    {
      "tpope/vim-dispatch",
      cmd = { "Dispatch" },
    },
    {
      "tpope/vim-commentary",
    },
    { "tpope/vim-surround" },
    {
      "tpope/vim-repeat",
    },
    { "unblevable/quick-scope" },
    {
      "tpope/vim-fugitive",
      cmd = {
        "G",
        "Git",
        "Gdiffsplit",
        "Gread",
        "Gwrite",
        "Ggrep",
        "GMove",
        "GDelete",
        "GBrowse",
        "GRemove",
        "GRename",
        "Glgrep",
        "Gedit",
      },
    },
    {
      "tpope/vim-rails",
      cmd = {
        "Eview",
        "Econtroller",
        "Emodel",
        "Smodel",
        "Sview",
        "Scontroller",
        "Vmodel",
        "Vview",
        "Vcontroller",
        "Tmodel",
        "Tview",
        "Tcontroller",
        "Rails",
        "Generate",
        "Runner",
        "Extract",
      },
    },
    -- {
    -- 	"christoomey/vim-rfactory",
    -- 	cmd = {
    -- 		"Rfactory",
    -- 		"RSfactory",
    -- 		"RVfactory",
    -- 		"RTfactory",
    -- 	},
    -- },
    {
      "kevinhwang91/nvim-bqf",
      event = { "BufRead", "BufNew" },
      config = configs.bqf,
    },
    -- {
    -- 	"tpope/vim-bundler",
    -- 	-- cmd = { "Bundler", "Bopen", "Bsplit", "Btabedit" },
    -- },
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      build = ":call mkdp#util#install()",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
    {
      "sindrets/diffview.nvim",
      cmd = { "DiffviewOpen", "DiffViewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
      config = configs.diffview,
    },
    {
      "mattn/emmet-vim",
      ft = { "html", "css", "eruby", "javascript" },
    },
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
        "eruby",
      },
    },
    {
      "jackieaskins/cmp-emmet",
      build = "npm run release",
    },
    { "ThePrimeagen/harpoon" },
    {
      "RishabhRD/nvim-cheat.sh",
      cmd = { "Cheat", "CheatWithoutComments" },
      dependencies = { "RishabhRD/popfix", opt = true },
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    -- {
    --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --   config = function()
    --     require("lsp_lines").setup()
    --     lvim.lsp.diagnostics.virtual_text = false
    --   end,
    -- },
    -- { "chrisbra/csv.vim" },
    {
      "nvim-treesitter/playground",
      config = function()
        require "nvim-treesitter.configs".setup {
          playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
              toggle_query_editor = 'o',
              toggle_hl_groups = 'i',
              toggle_injected_languages = 't',
              toggle_anonymous_nodes = 'a',
              toggle_language_display = 'I',
              focus_language = 'f',
              unfocus_language = 'F',
              update = 'R',
              goto_node = '<cr>',
              show_help = '?',
            },
          }
        }
      end,
    },
  }

end

return M
