# Todo

## Plugins

* set up emmet-ls
https://github.com/aca/emmet-ls
``` bash
aca/emmet-ls
```
``` bash
npm install -g emmet-ls
```
``` lua
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

* set up test plugin
https://github.com/rcarriga/vim-ultest

``` lua
use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
```

```
let g:ultest_use_pty = 1
```
