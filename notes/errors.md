# We want our search to be case sensitive
`:set noignorecase`
# Search for the O object and put the results in a quickfix list
`:vimgrep /O\./gj **/*`
# Open the quickfix
`:copen`
# Replace the O object with LV.  Confirm every change
`:cfdo %s/O\./LV./gc`

The % is a line range that specifies every line
  The g flag says to substitute all occurrences in each line
The c flag causes vim to ask you to confirm each replacement individually (you might want to leave this out)
# Write all the changes
  :cfdo update   or :wa write all changes(multiple times)  

# This file had a lot of occurrences of 'O.'.  Made sure not to change it
  utils/media/demo.png


#  There is a problem right now with the new_contract branch.  On first launch I got these errors

  Error while calling lua chunk: ...nelson/.local/share/lunarvim/lvim/lua/default-con
  fig.lua:328: module 'nlspsettings.jsonls' not found:

# So I manually cloned the plugin
  git clone https://github.com/tamago324/nlsp-settings.nvim.git ~/.local/share/lunarvim/site/pack/packer/start

# We will probably have to manually clone the plugin in the installer since this plugin gets used before packer has a chance to install it


# The colorscheme is being sourced twice.

  Preventing double sourcing of the colorscheme saves 6-7ms

  ```lua
  -- Turn syntax on before doing anything colorscheme related
  -- https://github.com/neovim/neovim/issues/9311
  vim.cmd "syntax on"

  -- disabling this line.  Is this required for spacegray to work? 
  -- vim.g.colors_name = lvim.colorscheme -- Colorscheme must get called after plugins are loaded or it will break new installs.
  ```

# I'm having trouble getting the core plugin callbacks to work

  Callbacks take the general form of 

  ```
lvim.plugin.telescope.on_config_done = function(module)
  module.load_extension("fzy_native")
  end
  ```

  But `module` has stopped working. Instead I have to use require directly in the callback function.

  ```
lvim.plugin.telescope.on_config_done = function(module)
  require("telescope").load_extension("fzy_native")
  end

  ```

  `module` seems to contain the right thing.  This is the output of `print(vim.inspect(module))`.  I'm not sure why it doesn't work.

  ```
{                                                                                         
  __format_setup_keys = <function 1>,                                                     
                      extensions = {                                                                          
                        fzy_native = {                                                                        
                          native_fzy_sorter = <function 2>                                                    
                        },                                                                                    
                        <metatable> = {                                                                       
                          __index = <function 3>                                                              
                        }                                                                                     
                      },                                                                                      
                      load_extension = <function 4>,                                                          
                      register_extension = <function 5>,                                                      
                      setup = <function 6>                                                                    
}                                  
```

#  Changing values in lv-config.lua now requires that neovim be restarted.  Is this expected behavior?

# `lua/lsp/null-ls.lua` is throwing errors when a formatter is not defined and needs a nil check

```
-- line 52
if lvim.lang[filetype].formatter ~= nil and lvim.lang[filetype].formatter.exe ~= nil then
executables = lvim.lang[filetype].formatter.exe
end
```

# I have no idea what changed but Autopairs can now be lazy loaded.  

Lazy-loading autopairs saves 5-6ms 

```
-- Autopairs
{
  "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "core.autopairs"
      if lvim.plugin.autopairs.on_config_done then
        lvim.plugin.autopairs.on_config_done(require "nvim-autopairs")
          end
          end,
},

  ```

  Compe still needs to auto-start but it only takes 0.3ms to start up so there's not much saving there

# These plugins will need to be installed by the installer script

  Nlsp-settings

  ```
  git clone https://github.com/tamago324/nlsp-settings.nvim.git ~/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim
  ```

  Null-ls

  ```
  git clone https://github.com/jose-elias-alvarez/null-ls.nvim.git ~/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim
  ```


# Orphaned configuration options

  lvim.database.auto_execute = 1
  lvim.database.save_location = "~/.config/lunarvim_db"


# Telescope does this to hot reload configuration 
  -- Hot reload stuff
  package.loaded['telescope'] = nil
  package.loaded['telescope.init'] = nil
  package.loaded['telescope.picker'] = nil
  package.loaded['telescope.finder'] = nil


  require("plenary.reload").reload_module("which-key")

  rg plenary.reload
  opt/which-key.nvim/lua/which-key/init.lua
  105:  require("plenary.reload").reload_module("which-key")

  start/popup.nvim/lua/tests/basic_popup_spec.lua
  1:require('plenary.reload').reload_module('popup')

  start/telescope.nvim/scratch/simplest_test.lua
  1:require('plenary.reload').reload_module('telescope')


  ===============================
  keybindings

  " Maximize current split horizontally and vertically
  map <C-W><Space> <C-W>_<C-W>\|
  map <C-W>m <C-W>_<C-W>\|

  " Unmap arrow keys
  nmap <Left> <Nop>
  nmap <Right> <Nop>
  nmap <Up> <Nop>
  nmap <Down> <Nop>

  Arrow keys are free for remapping

  noremap <C-LEFT> <C-W><C-H>
  noremap <C-DOWN> <C-W><C-J>
  noremap <C-UP> <C-W><C-K>
  noremap <C-RIGHT> <C-W><C-L>

060.718  000.236  000.236: sourcing /usr/local/share/nvim/runtime/syntax/syncolor.vim
078.196  000.203  000.203: sourcing /usr/local/share/nvim/runtime/syntax/syncolor.vim
079.282  000.164  000.164: sourcing /usr/local/share/nvim/runtime/syntax/syncolor.vim
079.722  000.165  000.165: sourcing /usr/local/share/nvim/runtime/syntax/syncolor.vim

