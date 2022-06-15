" ==================================
" General
" ==================================

set nocompatible            " disable compatibility to old-time v:i
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=a                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " add relative line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set colorcolumn=0           " removes the ugly red bar in the middle of the panel
set smarttab 				" smarttab
set noswapfile
set clipboard=unnamedplus   " enables the clipboard between other applications and nvim
set title
set wildmenu
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                   " enable spell check (may need to download language package)

" =========================================
" Cursor Configurations
" =========================================


" =========================================
" Installed Plugins
" =========================================

call plug#begin('~/.config/nvim/autoload/')

" ====== Plugin Section
 
 Plug 'dracula/vim'
 Plug 'preservim/nerdtree'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'vim-airline/vim-airline'
 Plug 'jiangmiao/auto-pairs'
 Plug 'sheerun/vim-polyglot'
 Plug 'plasticboy/vim-markdown'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'neovim/nvim-lspconfig'
 Plug 'gosukiwi/vim-atom-dark'
 Plug 'kyoz/purify'
 Plug 'folke/tokyonight.nvim'
 Plug 'EdenEast/nightfox.nvim'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'nvim-lua/plenary.nvim'
 call plug#end()

" ======================================
" THEMING CONFIGURATIONS
" ======================================

colorscheme tokyonight

" ======================================
" Plugin Configurations
" ======================================

" ====== NerdTree Plugin

" autocmd VimEnter * NERDTree | wincmd p

let NERDTreeShowHidden=1


" let g:NERDTreeDirArrowExpandable = '?'
" let g:NERDTreeDirArrowCollapsible = '?'

" ====== Airline Plugin

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ======================================
" Keyboard Shortcuts
" ======================================

" Normal mode remappings

nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

" Visual Mode remappings

let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" ======================================
" Lua Configurations
" ======================================

lua require('Bader-Dev')

" ======================================
" Sourcings Of Plugin Configurations
" ====================================== 
"
" ====== COC Configuretions

source $HOME/.config/nvim/plug-config/coc.vim

