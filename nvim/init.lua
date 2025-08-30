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
   
    "hit this to leave insert mode in terminal mode
    "tnoremap <Esc> <C-\\><C-n>

    "open in home directory
    cd ~
    
    "highlight the current row and column
    "set cursorline
    "set cursorcolumn

    " turn relative line numbers on
    " set relativenumber
    " set rnu
    set number
    set nu



    
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

require("config.lazy")

<<<<<<< HEAD
-- fidget setup
require("fidget").setup({})
=======
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
        "nvim-tree/nvim-tree.lua",
        'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
        -- { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "selenized" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
>>>>>>> d718dc7a98a46e0cb90ed5cf6bc07d4050bbfdcb

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




-- enable lsps
vim.lsp.enable({'luals','pico8_ls','eslint','rust_analyzer'})

-- taken from https://lsp-zero.netlify.app/docs/getting-started.html

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'


-- Setup Mason
require("mason").setup()

-- Setup Oil
require("oil").setup()

-- Built in Autocompletion
--vim.api.nvim_create_autocmd('LspAttach', {
  --callback = function(ev)
    --local client = vim.lsp.get_client_by_id(ev.data.client_id)
    --if client:supports_method('textDocument/completion') then
      --vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    --end
  --end,
--})

-- autostart NvimTree on launch
--vim.cmd('NvimTreeOpen')
