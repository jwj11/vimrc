" ------ Plug+Plugins ------

" Auto install plugins, need bash
if !has("unix")
  " Don't use vimfiles
  set rtp+=~/.vim
endif
let b:rtplocation=expand('~/.vim')
let b:baselocation=b:rtplocation . '/autoload'
let b:pluglocation=b:baselocation . '/plug.vim'
if !filereadable(b:pluglocation)
  " --create-dirs is broken
  execute '!mkdir -p ' . b:baselocation
  execute '!curl -fLo ' . b:pluglocation . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo 'Type :PlugInstall!'
endif

" List of plugins
call plug#begin(b:rtplocation . '/plugged')
Plug 'scrooloose/syntastic' " Syntax checking
Plug 'scrooloose/nerdtree' " Folder trees
Plug 'Lokaltog/vim-easymotion' " Jump to letters
Plug 'msanders/snipmate.vim' " Snippets for all languages
Plug 'vim-scripts/YankRing.vim' " Loop through copy paste history
Plug 'bling/vim-airline' " Pretty status bar
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy search
Plug 'pangloss/vim-javascript' " Syntax
call plug#end()

" ------ Settings ------ 

syntax enable
set background=dark
colorscheme solarized

" Remove directory from buffer line names
let g:airline#extensions#tabline#fnamemod = ':t'

let mapleader = ',' " Prefix key for many commands
nnoremap <Leader>a :NERDTreeFocus<CR>
nnoremap <Leader>s :NERDTreeToggle<CR>
filetype plugin indent on " Auto react to file type changes

" Show tabs, keys for switching between tabs
let g:airline#extensions#tabline#enabled = 1

set rnu nu " Relative line numbers for easy jump

set hlsearch " Highlight search results
set laststatus=2 " Display toolbar

" Every tab everywhere is 2 spaces
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab shiftround
set mouse=a
