---
banner: "![[nvimbanner.jpg]]"
---
# Neovim Installation: (stable - nightly) (linux)

## Stable Edition Installation Process:

- Fetch the neovim package for your system by checking this neovim main repository - https://github.com/neovim/neovim or alternatively you could use your system's package manager to download the package, it's usually under the name 'nvim' or 'neovim'.

## Nightly Edition Installation Process: (build from source) [Supports LSP natively]

- Install the required tools to compile and build the source ⤵️

```
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
```

- Then move the directory into it

```
cd $(mktemp -d)
```

- Clone it:

```
git clone https://github.com/neovim/neovim --depth 1
```

- Move into it:

```
cd neovim
```

- Now start building asuming you did install the required tools for the build:

```
sudo make CMAKE_BUILD_TYPE=Release install
```

- Move out to finish: 

```
cd ..
```

- It's optional but you can remove the directory if you want:

```
sudo rm -r neovim
```

- DONE 😜


# Neovim Configurations: (stable - nightly) (linux) [Dotfiles & No Dotfiles]

## Configurations With Dotfiles:

- First make sure your in your home dirsctory by runing the following:

```
cd ~
```

- Now make sure you have git installed and run this command: (make sure your git is configured properly before runing this command):

```
git clone https://github.com/Bader-Dev/dotfiles.git
```

- By doing that you have downloaded and copied my dot config folders seccussfuly into your system properly, now let's move into your .config folder:

```
cd ./.config
```

- Then link the nvim folder from the dotfiles folder into your .config folder

```
ln -s ../dotfiles/nvim ./nvim
```

- DONE 😜

## Configurations Without Dotfiles:

- Let's move to your .config folder create a folder in there:

```
cd ~/.config && mkdir nvim
```

- And create a file in the nvim directory:

```
cd nvim && touch init.vim
```

- Assuming you have nvim ready to use lets open the file we created with it:

```
nvim init.vim
```

- Once it loaded copy the following:

``` lua
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
 Plug 'arcticicestudio/nord-vim'
 Plug 'folke/tokyonight.nvim'
 Plug 'EdenEast/nightfox.nvim'
 Plug 'bluz71/vim-nightfly-guicolors'
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

```

- Once copied go back to your nvim and click ``` i ``` and ``` ctrl or command ``` and  hit ``` v ```

- Then after that click  ``` ESC ``` and type  ``` :wq ```

- Now let's create the lua files for That The Language Server and your plugins will use to get configured:

```
cd ~/.config/nvim/ && mkdir lua
```

- And then let's create a user profile (we will call it "badar" for now) to host the configurations in:

```
cd ~/.config/nvim/lua && mkdir badar
```

- And then make two seperate files named lspconfis.lua and init.lua in the badar directory

```
touch lspconfig.lua init.lua
```

- Put  ```require('badar.lspconfig')``` in the ``` init.lua ``` and then exit ``` nvim ``` 

- With what we done have declared to ``` init.lua ```  that ``` lspconfig.lua ``` exists and needs to sourced.

- Head over ``` nvim ~/.config/nvim/init.vim ``` and at the bottom of the file type the following and replace "badar" with the name you chose beforehand

```
" ======================================
" Lua Configurations
" ======================================

lua require('bader')
```

- Save it.

- Go and fetch the lastest version of node 16...+ and then install on your system.

- After that follow the instruction bellow:

## Configurations with or with dotfiles: [LSP, COC Extensions ext...]

- For us to use the plugins menshioned in the dotfiles and ``` init.vim ``` file we need to get a plugin manager, and the one I am using here is "vim-plug" bc it is pretty easy to use for one and pretty customisable. to get it head over to the github repository bellow:
[vim-plug's repository](https://github.com/junegunn/vim-plug) and select your installer from there (linux, mac or windows).

- After that go ahead over to nvim by runing ``` nvim ``` in the terminal, once it loads hit ``` ESC ``` and type ``` :PlugInstall ``` vim plug installs all the necessary plugins that are menshioned in the file ``` init.vim ```.

- Finaly when "vim-plug" finishes with it's installation process, head over  exit ``` nvim ``` by pressing ``` ESC ``` and typing ``` :wq! ``` 

- Before we install anything make sure you have the latest LTS version of node installed on your system only then we can install your Favourite Language Servers aka LSPs

- If it's installed go to [LSP servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) and scroll towards Your Favourite Language Server and and click on it, and then copy it's npm install command for me the server I selected was tsserver and the command to install looks like this:

```
npm install -g typescript typescript-language-server
```

- Run the command in your terminal and let it finish if there was any error try to run  again the command but with ``` sudo -i ``` at the beginging (we can trust the source on this one 👍)

- Once npm finished the installation of the LSP go back to were you got the command to install it and then scroll down to the section that saids ``` Snippet to enable the language server: ```  and copy the command, go to your terminal so you can navigate to your ``` lspconfig.lua ``` file and put the command in it by using ``` nvim ```

- Open this [link](https://github.com/neovim/nvim-lspconfig) and scroll down towards section named "Suggested configuration" there you can copy the example into you ``` lspconfig.lua ``` file and tinker with it like edit it and remove the Lsp that you haven't installed and such.

- When You have finished hit ``` ESC ``` and type ``` :wq! ```.

- Now the next steps are for setting up the complete plugin aka ``` COC-Completion ```

- If you have used dotfiles then the next step is of no importance to you so just skip ahead.

- Go in your nvim folder and create a folder named ``` plug-config ```
 and create a file named ``` coc.vim ``` in it,  go to this github [repository](https://github.com/neoclide/coc.nvim) and copy text in section "Example vim configuration" into ``` coc.vim ```

- You are now almost done, what is left for us to do is install the extensions for completion and it's pretty easy "by the way even if you have dotfiles you still going to have to install them hhh"

- Go to this [link](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) and scroll down to section "Implemented coc extensions" and find extension for your LSP and hit click on it, scroll to section "Install" and copy the snippet to your ``` nvim command ```  and paste it there, wait for it to install.

- Then You can check the health of your system and it's plugings by runing the command bellow:

```
:Checkhealth
```

- If it says "Ok" then you're good to go 👍

- Done 😁





#neovim #ide #texteditor #terminal #docs #webdevelopment #frontenddevelopment #cmd 