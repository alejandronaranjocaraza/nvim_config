vim.g.mapleader = " "  -- This sets <leader> to the space bar
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd('set number')           -- Enable absolute line numbers
vim.cmd('set relativenumber')   -- Enable relative line numbers

-- REMAP KEYS-----------------------------------------------
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })

-- TMUX NAV KEYS --------------------------------------------
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- LAZY------------------------------------------------------
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    --- COLOUR SCHEME
    require("plugins.rose-pine"),
    --- TELESCOPE
    require("plugins.telescope"),
    --- TREESITER
    require("plugins.treesitter"),
    ---NEOTREE
    require("plugins.neotree"),
    ---MASON
    require("plugins.lsp-config"),
    ---NONE-LS
    require("plugins.none-ls"),
    ---COMPLETIONS
    require("plugins.completions"),
    ---DEBUGGINIG
    require("plugins.debugging"),
    ---TMUX-NVIM NAV
    require("plugins.nvim-tmux-navigator"),
    ---VIM TEST
    require("plugins.vim-test"),
    ---VIM SLIME
    require("plugins.vim-slime")
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

