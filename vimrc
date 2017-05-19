" Vundle installing with command
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Run vim and the command :PluginInstall


" Vundle management stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-rails'
Plugin 'mileszs/ack.vim'

call vundle#end()

set tabstop=4		" Make tabs 4 characters wide
set shiftwidth=4	" Make indents 4 characters wide
set expandtab		" Make tabs automatically to spaces
set softtabstop=4	" Make backspace behave as expected
set incsearch		" Incremental search

set linebreak       " Soft break long lines at word boundaries
set number          " Line numbers
set ruler           " Cursor position information
set laststatus=2    " Always show the status bar

set formatoptions=tcqrj
set textwidth=80

set autoindent      " Automatic Indentation of new lines
set smartindent     " Smart indentation of text and code

filetype plugin indent on

autocmd Filetype gitcommit setlocal textwidth=72
autocmd Filetype C setlocal tabstop=8 shiftwidth=8 softtabstop=8
autocmd Filetype cpp setlocal shiftwidth=2 softtabstop=2 
autocmd Filetype Makefile setlocal noexpandtab

syntax on

" Colorscheme
" We want the nice dark background solarized scheme that we installed
set background=dark
colorscheme solarized

" Change leader to <Bar>
let mapleader = " "

"" Vinegar configuration
map <C-n> :Explore<CR>

" --- ack.vim ---
let g:ackprg = 'ag --vimgrep' " Use Ag instead of ack
nnoremap <Leader>a :Ack!<Space>

" --- fzf ---
nnoremap <Leader>f :FZF<CR>

" Quick tab movement
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <C-Tab> :tabnext<CR>

" Quick quickfix movement
nnoremap <Leader>] :cnext<CR>
nnoremap <Leader>[ :cprev<CR>
