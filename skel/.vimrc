if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
call plug#end()

set noshowmode
set number relativenumber
set nu rnu
set expandtab
set shiftwidth=2
set softtabstop=2

autocmd FileType java AutoFormatBuffer google-java-format
autocmd FileType java setlocal omnifunc=javacomplete#Complete

colorscheme delek

"Lightline is configured to show Git status
let g:lightline = {
  \ 'colorscheme': 'delek',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'readonly', 'filename', 'modified', 'gitstatus' ]
  \   ]
  \ },
  \ 'component_function': {
  \   'gitstatus': 'FugitiveStatusline'
  \ }
\}

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>w :Gwrite<CR>
