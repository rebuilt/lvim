# Todo

## Plugins

- set up emmet-ls
  https://github.com/aca/emmet-ls

```bash
aca/emmet-ls
```

```bash
npm install -g emmet-ls
```

```lua
local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css'};
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end
lspconfig.emmet_ls.setup{ capabilities = capabilities; }
```

- set up test plugin
  https://github.com/rcarriga/vim-ultest

```lua
use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
```

```
let g:ultest_use_pty = 1
```

rtp - rolling 67a0ee6

```lua
-- rtp list:
"/home/nelson/.local/share/lunarvim/lvim"
"/home/nelson/.config/lvim"
"/home/nelson/.config/lvim/after"
"/home/nelson/.local/share/lunarvim/site"
"/home/nelson/.local/share/lunarvim/site/after"
-- pack list:
"/home/nelson/.local/share/lunarvim/lvim"
"/home/nelson/.config/lvim"
"/home/nelson/.config/lvim/after"
"/home/nelson/.local/share/lunarvim/site"
"/home/nelson/.local/share/lunarvim/site/after"
```

- ff4b5b1 - fix runtime path (#1443) (20 hours ago) <Aaron Saw Min Sern>

```lua
-- rtp list:
"/home/nelson/.config/lvim"
"/home/nelson/.local/share/lunarvim/site"
"/home/nelson/.local/share/lunarvim/lvim"
"/home/nelson/.local/share/lunarvim/site/after"
"/home/nelson/.config/lvim/after"
-- pack list:
"/home/nelson/.config/lvim"
"/home/nelson/.local/share/lunarvim/site"
"/home/nelson/.local/share/lunarvim/lvim"
"/home/nelson/.local/share/lunarvim/site/after"
"/home/nelson/.config/lvim/after"
```

- c7aa418 - (HEAD -> rolling, origin/rolling, origin/HEAD) Merge branch 'rolling' of github.com:LunarVim/LunarVim into rolling (20 hours ago) <Christian Chiarulli>

```lua
-- rtp list:
"/home/nelson/.config/lvim"
"/home/nelson/.local/share/lunarvim/site"
"/home/nelson/.local/share/lunarvim/lvim"
"/home/nelson/.local/share/lunarvim/site/after"
"/home/nelson/.config/lvim/after"
-- pack list:
"/home/nelson/.config/lvim"
"/home/nelson/.local/share/lunarvim/site"
"/home/nelson/.local/share/lunarvim/lvim"
"/home/nelson/.local/share/lunarvim/site/after"
"/home/nelson/.config/lvim/after"
```
