if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
endif


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rsi'
Plugin 'chriskempson/base16-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'osyo-manga/vim-over'
Plugin 'luochen1990/rainbow'

call vundle#end()
filetype plugin indent on


" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'rxvt-unicode'
  let &t_SI = "\<Esc>[5 q"
  let &t_EI = "\<Esc>[1 q"
endif
set gcr=n:blinkon0

let g:rainbow_active = 1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode=0
let mapleader=' '

colorscheme base16-default
filetype on
syntax on
set nocompatible
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/.ensime*,*/webjars,*/target,*/wms1/data,*/wms2/*/managed
set title titlestring=%F\ -\ vim
set number
set colorcolumn=120
set laststatus=2
set foldcolumn=0
set noswapfile
set expandtab
set tabstop=2
set shiftwidth=2
set mouse=a
set nowrap
set hlsearch

:nnoremap <CR> :nohlsearch<CR><CR>
map <C-n> :NERDTreeToggle<CR>


"set autochdir
