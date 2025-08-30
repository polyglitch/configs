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

-- fidget setup
require("fidget").setup({})

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
