set nocompatible              " be iMproved, required
filetype off                  " required

nnoremap <leader>n :NERDTreeFocus
nnoremap <C-n> :NERDTree
nnoremap <C-t> :NERDTreeToggle
nnoremap <C-f> :NERDTreeFind

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required

" https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" https://vimawesome.com/plugin/nerdtree
Plugin 'preservim/nerdtree'
Plugin 'farmergreg/vim-lastplace'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" line numbers
set number

" Enable Syntax Highlighting
syntax on
 
" default, blue, darkblue, delek, desert, elford, evening, industry, koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, zellner
colorscheme default

" Setting Tab Size
set tabstop=4

" Enabling Automatic Indentation
set autoindent

" Replacing Tabs with White Spaces
set expandtab

" Removing Multiple Spaces on Single Backspace
set softtabstop=4

" Highlight the Current Line
set cursorline

" The 'viminfo' option is a string containing information about what info should be stored, and contains limits on how much should be stored (see 'viminfo')
set viminfo='100,<1000,s100,h

