" Vundle installing with command
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Run vim and the command :PluginInstall


" Vundle management stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-rails'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

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

set formatoptions=tcqrjn
set nojoinspaces
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

" --- ack.vim ---
let g:ackprg = 'ag --vimgrep' " Use Ag instead of ack
nnoremap <Leader>a :Ack!<Space>

" --- fzf ---
nnoremap <Leader>f :FZF<CR>
inoremap <expr> <C-x><C-g> fzf#complete('git log --format=%s')

" General function to use as a FZF sink for inserting
function! s:insert_sink(line)
  put! =a:line
endfunction

" This command strips final parenthetical remarks from commit titles and ignores
" git commit reverts, and feeds the resulting unique list of titles to fzf.
command! PastCommits :call fzf#run({'source': 'git log --format=%s | sed -e "s/ (.*)$//" -e "/^Revert/d" | sort -u -V -r', 'sink': function('s:insert_sink')})

nnoremap <Leader>g :PastCommits<CR>

" --- NerdCommenter ---
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'

" Quick quickfix movement
nnoremap <Leader>] :cnext<CR>
nnoremap <Leader>[ :cprev<CR>
