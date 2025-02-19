vim.cmd([[
    "ui settings
    set guifont=IosevkaTerm\ Nerd\ Font\ h:20
    set termguicolors
    colorscheme selenized_bw

    syntax on
    set showmatch


    set statusline+=\ %F\ %M\ %Y\ %R\ row\ %l\ col\ %c\
    "set guioptions=mlrb
    set showmode
    set number


    let maplead = "\<Space>"  
    nnoremap <leader>y = ggVG"*y
    nnoremap <leader>p = gg0dG"*p
    
    "open in home directory
    cd ~
    
    "open in directory of file
    set autochdir

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
    set scrolloff=3
]])

vim.o.guifont = "IosevkaTerm Nerd Font:h20"

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

--"calind/selenized.nvim",
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here
        "tpope/vim-surround",
        "tpope/vim-fugitive",
        "kyazdani42/nvim-web-devicons",
        "altercation/vim-colors-solarized",
        "crusoexia/vim-monokai",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-lint",
        "mhartington/formatter.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
        -- "luukvbaal/nnn.nvim", 
        "nvim-tree/nvim-tree.lua",
        'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
        { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "selenized" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- lualine setup
require("lualine").setup({})

-- nvim-tree setup
require("nvim-tree").setup({
    view = {
        width = 20,
    },
    renderer = {
        group_empty = true,
    },
})

-- taken from https://lsp-zero.netlify.app/docs/getting-started.html

-- Setup completion
-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- Setup Mason
require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = { "lua_ls", "rust_analyzer","pylsp","java_language_server"},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
}


---
-- Autocompletion config
---
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})

-- autostart NvimTree on launch
vim.cmd('NvimTreeOpen')
