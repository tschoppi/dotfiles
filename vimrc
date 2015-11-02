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

call vundle#end()

set tabstop=4		" Make tabs 4 characters wide
set shiftwidth=4	" Make indents 4 characters wide
set expandtab		" Make tabs automatically to spaces
set softtabstop=4	" Make backspace behave as expected
set incsearch		" Incremental search
set autoindent      " Automatic Indentation

set linebreak       " Soft break long lines at word boundaries
set number          " Line numbers
set ruler           " Cursor position information
set laststatus=2    " Always show the status bar

autocmd Filetype gitcommit setlocal textwidth=72
autocmd Filetype C setlocal tabstop=8 shiftwidth=8 softtabstop=8
autocmd Filetype Makefile setlocal noexpandtab

" Colorscheme
colorscheme evening

" Change leader to <Bar>
let mapleader = " "

"" Nerd-Tree configuration
map <C-n> :NERDTreeToggle

""""" For Latex-Suite
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" To compile into PDF by defauls
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

