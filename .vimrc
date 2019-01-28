set nocompatible

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'jiangmiao/auto-pairs'
Plugin 'maralla/completor.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'cespare/vim-toml'
Plugin 'chriskempson/base16-vim'
Plugin 'cseelus/vim-colors-lucid'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'ensime/ensime-vim'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/csapprox'
"Plugin 'KevinGoodsell/vim-csexact'
Plugin 'itchyny/lightline.vim'
Plugin 'jacoborus/tender.vim'
"Plugin 'kiddos/malokai.vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'luochen1990/rainbow'
Plugin 'mxw/vim-jsx'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'osyo-manga/vim-over'
Plugin 'pangloss/vim-javascript'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'racer-rust/vim-racer'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'StanAngeloff/php.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
if &term=~'linux'
  let g:CSApprox_loaded = 1
endif

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

call vundle#end()
filetype plugin indent on


" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term =~ 'rxvt-unicode'
  let &t_SI = "\<Esc>[5 q"
  let &t_EI = "\<Esc>[1 q"
endif

let g:rainbow_active = 1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode=0
let mapleader=' '

set background=dark
"colorscheme malokai
colorscheme base16-default-dark
"set t_Co=256 " 256 color mode
"let base16colorspace=256
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

set t_md=
filetype on
syntax on
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/.ensime*,*/webjars,*/target,*/wms1/data,*/wms2/*/managed
set title titlestring=%F\ -\ vim
set number
"set colorcolumn=120
set laststatus=2
set foldcolumn=0
set noswapfile
set nobackup
set nowb
set expandtab
set tabstop=2
set shiftwidth=2
set mouse=a
set nowrap
set hlsearch
set scrolloff=10
set autoread
set clipboard^=unnamed,unnamedplus
set go+=a
set hidden
"set virtualedit=all


map <C-n> :NERDTreeToggle<CR>

set cursorline

"set autochdir


" Use ag over grep
set grepprg="ag\ --nogroup\ --nocolor \ --hidden"
let g:ag_prg="ag --hidden --vimgrep"

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden


" Don't update the display while executing macros
set lazyredraw


" Trim whitespace
autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e


" Toggle paste mode
nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>cr :lcd <c-r>=FindCodeDirOrHome()<cr><cr>
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

"au FileType scala nnoremap <localleader>df :EnDeclaration<CR>
"au FileType scala nnoremap <localleader>ds :EnDeclarationSplit<CR>


" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" git / fugitive
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
"nnoremap <space>gps :Dispatch! git push<CR>
"nnoremap <space>gpl :Dispatch! git pull<CR>

" ensime
nnoremap <space>nt :EnType<CR>
nnoremap <space>nd :EnDeclaration<CR>
nnoremap <space>ns :EnDeclarationSplit<CR>
"autocmd BufWritePost *.scala :EnTypeCheck

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" rust
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
let g:racer_experimental_completer = 1

" completor

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"let g:completor_auto_trigger = 0
"inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"

function! FindCodeDirOrHome()
  let filedir = expand('%:p:h')
  if isdirectory(filedir)
    if HasGitRepo(filedir)
      let cmd = 'bash -c "(cd ' . filedir . '; git rev-parse --show-toplevel 2>/dev/null)"'
      let gitdir = system(cmd)
      if strlen(gitdir) == 0
        return '~/'
      else
        return gitdir[:-2] " chomp
      endif
    else
      return '~/'
  else
    return '~/'
  endif
endfunction

function! HasGitRepo(path)
  let result = system('cd ' . a:path . '; git rev-parse --show-toplevel')
  if result =~# 'fatal:.*'
    return 0
  else
    return 1
  endif
endfunction
