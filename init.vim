" set colors
set termguicolors
colorscheme shades_of_purple

" plugins
call plug#begin()
Plug '~/Development/fzf'
Plug 'junegunn/fzf.vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ajh17/vimcompletesme'

call plug#end()

" Language Server Protocol
set hidden

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" file encoding
set encoding=utf-8
set fileencoding=utf-8

" set indentation
set tabstop=4 " for tabs
set softtabstop=4 " for spaces
set shiftwidth=4
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

" fzf and ripgrep
nnoremap <leader>p :Files<CR>
nnoremap <leader>r :Rg<CR>
