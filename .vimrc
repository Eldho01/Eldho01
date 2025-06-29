syntax on
set mouse=a              " enable mouse clicks
set number
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set wrap
set ruler
set backspace=indent,eol,start
set noswapfile
set nowritebackup
set nocompatible
set completeopt=menuone,noinsert,noselect
set background=dark
set t_Co=256

" Enable filetype Plugins and indentation
filetype plugin indent on

" --- Plugin Manager ---
" Make sure you have vim-plug installed
call plug#begin('~/.vim/plugged')

" Auto-pairs for brackets and quotes
Plug 'jiangmiao/auto-pairs'

" You removed coc.nvim here

call plug#end()

