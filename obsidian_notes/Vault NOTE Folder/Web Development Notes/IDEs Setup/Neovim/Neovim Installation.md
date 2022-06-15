# Neovim Installation and configurations: (linux)

## Installation Process:

1. Fetch the neovim package for your system by checking this neovim main repository - https://github.com/neovim/neovim or alternatively you could use your system's package manager to download the package, it's usually under the name 'nvim' or 'neovim'.
2. Install the package and create a folder in your main ' ./.config' directory named 'nvim'
3. Touch a file called 'init.vim' in there
4. Copy the following text into it:

```lua
set nocompatible " disable compatibility to old-time vi  
set showmatch " show matching  
set ignorecase " case insensitive  
set mouse=v " middle-click paste with  
set hlsearch " highlight search  
set incsearch " incremental search  
set tabstop=4 " number of columns occupied by a tab  
set softtabstop=4 " see multiple spaces as tabstops so <BS> does the right thing  
set expandtab " converts tabs to white space  
set shiftwidth=4 " width for autoindents  
set autoindent " indent a new line the same amount as the line just typed  
set number " add line numbers  
set wildmode=longest,list " get bash-like tab completions  
set cc=80 " set an 80 column border for good coding style  
filetype plugin indent on "allow auto-indenting depending on file type  
syntax on " syntax highlighting  
set mouse=a " enable mouse click  
set clipboard=unnamedplus " using system clipboard  
filetype plugin on  
set cursorline " highlight current cursorline  
set ttyfast " Speed up scrolling in Vim  
" set spell " enable spell check (may need to download language package)  
" set noswapfile " disable creating swap file  
" set backupdir=~/.cache/vim " Directory to store backup files. 
```

## Configuration Process

1. Open that browser again and go look for vim-plug plugin to install or alternatively you can go immediately through this [link](https://github.com/junegunn/vim-plug)
2. Then go back to "./.config/nvim/" and open "init.vim" and at the bottom past the following:

```lua
call plug#begin('~/.config/nvim/autoload/')
" Plugin Section  
Plug 'dracula/vim'  
Plug 'ryanoasis/vim-devicons'  
Plug 'SirVer/ultisnips'  
Plug 'honza/vim-snippets'  
Plug 'scrooloose/nerdtree'  
Plug 'preservim/nerdcommenter'  
Plug 'mhinz/vim-startify'  
Plug 'neoclide/coc.nvim', {'branch': 'release'}  
call plug#end()
```

3. Finaly go back to your shell "terminal of your choice" and then open nvim, press "ESC" and then type ":PlugInstall" to begin to setup the basic plugins and functionality.