" Install Plug as follows:
" nvim:
"   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" vim:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Run (n)vim and the command :PlugInstall

call plug#begin('~/.vim/bundle')

Plug 'Lokaltog/vim-powerline'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-rails'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

call plug#end()

set rtp+=/usr/bin/fzf

set tabstop=2		" Make tabs 2 characters wide
set shiftwidth=2	" Make indents 2 characters wide
set expandtab		" Make tabs automatically to spaces
set softtabstop=2	" Make backspace behave as expected
set incsearch		" Incremental search

set linebreak       " Soft break long lines at word boundaries
set number          " Line numbers
set ruler           " Cursor position information
set laststatus=2    " Always show the status bar

" Clear search highlighting before redrawing the screen
set nohls
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

set formatoptions=tcqrjn
set nojoinspaces
set textwidth=80
set list            " Show list characters

set autoindent      " Automatic Indentation of new lines
set smartindent     " Smart indentation of text and code

filetype plugin indent on

autocmd Filetype gitcommit setlocal textwidth=72
autocmd Filetype C setlocal tabstop=8 shiftwidth=8 softtabstop=8
autocmd Filetype cpp setlocal shiftwidth=2 softtabstop=2 
autocmd Filetype python setlocal shiftwidth=2 softtabstop=2
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
nnoremap <Leader>f :FZF --preview=head\ -25\ {}<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>w :Windows<CR>
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
