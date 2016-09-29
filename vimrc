" Vundle installing with command
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Run vim and the command :PluginInstall


" Vundle management stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

set tabstop=4		" Make tabs 4 characters wide
set shiftwidth=4	" Make indents 4 characters wide
set expandtab		" Make tabs automatically to spaces
set softtabstop=4	" Make backspace behave as expected
set incsearch		" Incremental search
set autoindent      " Automatic Indentation of new lines
set smartindent     " Smart indentation of text and code

set linebreak       " Soft break long lines at word boundaries
set number          " Line numbers
set ruler           " Cursor position information
set laststatus=2    " Always show the status bar

set formatoptions=tcqr
set textwidth=80

autocmd Filetype gitcommit setlocal textwidth=72
autocmd Filetype C setlocal tabstop=8 shiftwidth=8 softtabstop=8
autocmd Filetype cpp setlocal shiftwidth=2 softtabstop=2 
autocmd Filetype Makefile setlocal noexpandtab

" Colorscheme
" We want the nice dark background solarized scheme that we installed
set background=dark
colorscheme solarized

" Change leader to <Bar>
let mapleader = " "

"" Nerd-Tree configuration
map <C-n> :NERDTreeToggle
