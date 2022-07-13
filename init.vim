set mouse=a
set encoding=utf-8
set number
set noswapfile 
set scrolloff=7
set colorcolumn=79

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on

inoremap kl <esc>
nnoremap ,<space> :nohlsearch<CR>

call plug#begin('~/.vim/plugged')

Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'sbdchd/neoformat'
Plug 'Pocco81/AutoSave.nvim'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdcommenter'
Plug 'folke/which-key.nvim'

call plug#end()

colorscheme material
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

lua << EOF
local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
EOF

let g:neomake_python_enabled_makers = ['pylint']
let g:airline#extensions#tabline#enabled = 1
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
