" http://dougblack.io/words/a-good-vimrc.html

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
"...

call vundle#end()
filetype plugin indent on

" set color scheme
set t_Co=256
colorscheme molokai

" enable syntax highlighting
syntax enable

" file encoding
set encoding=utf-8
set fileencoding=utf-8

" set indentation
set tabstop=2 " for tabs
set softtabstop=2 " for spaces
set shiftwidth=2
set expandtab " convert tabs to spaces
set autoindent
set smartindent

" UI
set number
" set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch

" show whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" searching
set incsearch
set hlsearch

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" Movement
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>


" Leader
let mapleader=","
inoremap jk <esc>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
