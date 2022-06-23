" ==================================
" GENERAL SETTINGS ===>
" ==================================
set nocompatible            " disable compatibility to old-time v:i
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=a                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set ic                      " Add Case Insensitive To earch Commmand
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
set smarttab                " smarttab
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
" INSTALLED PLUGINGS ===> 
" =========================================

call plug#begin('~/.config/nvim/autoload')

" ====== Plugin Section ======
 
 " === General Coding Plugins ===
 
 Plug 'nvim-lua/plenary.nvim' " Used By Telescope As A Depandancy
 Plug 'nvim-telescope/telescope.nvim' " Telescope Plugin To Search File System of A Project
 Plug 'BurntSushi/ripgrep' " Used As A dependancy By The Telescope Pluging
 Plug 'phaazon/hop.nvim' " Plugin To use To Hop over A document By A set O Letters
 Plug 'preservim/nerdtree' " NerdTree Plugin
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Highlighting Code
 Plug 'luochen1990/rainbow' " Color The Parerenthis and brackets surronding
 Plug 'tpope/vim-surround' " Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more.
 Plug 'preservim/nerdcommenter'

" === Lsp Plugins ===
 
 Plug 'neoclide/coc.nvim', {'branch': 'release'} " Vscode Completion Tool That Uses Lsp Configurations
 Plug 'neovim/nvim-lspconfig' " Lsp Config To config LSPs
 " Plug 'SirVer/ultisnips' 
 Plug 'honza/vim-snippets' 
 Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
 
 " === Theme Plugins ===

 Plug 'folke/tokyonight.nvim' " TokyoNight Theme
 Plug 'EdenEast/nightfox.nvim' " Nightfox Theme
 Plug 'sainnhe/sonokai' " Sonokai Theme 
 Plug 'joshdick/onedark.vim' 
 Plug 'Rigellute/shades-of-purple.vim'

 " === UI/UX Plugins ===
 
 
 
 
 Plug 'scrooloose/nerdtree'
 Plug 'mhinz/vim-startify' " Nice Looking Starting Page
 Plug 'ryanoasis/vim-devicons' " Plugin For Icons In Vim 
 Plug 'vim-airline/vim-airline' " Nice Looking Bottom Bar
 Plug 'vim-airline/vim-airline-themes' " Vim Airine Themes Plugin
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'romgrk/barbar.nvim'

 call plug#end()

" ======================================
" THEMING CONFIGURATIONS ===>
" ======================================

colorscheme tokyonight 
 
" ======================================
" Plugin Configurations ===>
" ======================================

" ====== NerdTree Plugin ======

" autocmd VimEnter * NERDTree | wincmd p

let NERDTreeShowHidden=1


" let g:NERDTreeDirArrowExpandable = '?'
" let g:NERDTreeDirArrowCollapsible = '?'

" ====== Airline Plugin ======

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ====== Rainbow Configs ======
 
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" ======================================
" Lua Configurations
" ======================================

lua require('Bader-Dev')

" ======================================
" Sourcings Of Plugin Configurations
" ====================================== 

" ====== COC Configuretions ======

source $HOME/.config/nvim/plug-config/coc.vim

" source $HOME/.config/nvim/autoload/tagalong.vim
" ======================================
" Keyboard Bindings
" ======================================

" ====== General Keybindings ====

nnoremap <C-q> :q!<cr>
nnoremap <C-s> :wq<cr>
nnoremap <C-w> :w<cr>

" ====== Normal mode remappings ======

" === Leader Key Mapping ===

let mapleader = " " " map leader to Space

" noremap <C-q> :q!<CR>
" nnoremap <F3> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F4> :sp<CR>:terminal<CR>

" === Telescope Keybindings ===

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

" === NerdCommenter Keybindings ===

nnoremap <leader>c <Plug>NERDCommenterToggle

" === Hop Keybindings ===

nnoremap <leader>fl <cmd>:HopLine<cr>

" === Vim-Snippets Keybindings ===

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
