:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set noswapfile
:set nobackup
:set nowritebackup
:set updatetime=300
:set signcolumn=yes
:set scrolloff=7

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion
Plug 'windwp/nvim-autopairs' " Auto Pairs
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'https://github.com/vim-autoformat/vim-autoformat'
Plug 'https://github.com/Konfekt/vim-wsl-copy-paste'

call plug#end()

:set completeopt-=preview " For No Previews
:set encoding=UTF-8
" :colorscheme jellybeans
:colorscheme moonfly

nnoremap ,<space> :nohlsearch<CR>
nmap <F8> :TagbarToggle<CR>

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
noremap <F3> :Autoformat<CR>

inoremap jk <ESC>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:python3_host_prog="/usr/bin/executable/"

function! s:check_back_space() abort
		let col = col('.') - 1
		    return !col || getline('.')[col - 1]  =~ '\s'
		endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
		\ coc#pum#visible() ? coc#pum#next(1):
		\ <SID>check_back_space() ? "\<Tab>" :
		\ coc#refresh()
inoremap <expr><F2> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

lua << EOF
require("nvim-autopairs").setup {}
EOF

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
