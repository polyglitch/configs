vim.cmd([[
    set guifont=Iosevka\ Fixed:h14
    colorscheme selenized
    set background=dark

    syntax on
    set showmatch

    set statusline+=\ %F\ %M\ %Y\ %R\ row\ %l\ col\ %c\
    set guioptions=mlrb
    set showmode
    set number


    let maplead = "\<Space>"  
    nnoremap <leader>y = ggVG"*y
    nnoremap <leader>p = gg0dG"*p

    cd C:\Users\polyg\workspace

    set mouse=a
    set nocompatible

    set ignorecase
    set hlsearch

    set autoindent
    set wildmode=longest,list

    filetype plugin indent on
    set tabstop=4
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set showmatch
]])


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
        "kyazdani42/nvim-web-devicons",
        "altercation/vim-colors-solarized",
        "crusoexia/vim-monokai",
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})


-- Setup Mason
require("mason").setup()
