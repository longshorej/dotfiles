set nocompatible

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'mileszs/ack.vim'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'maralla/completor.vim'
Plugin 'ajh17/VimCompletesMe'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'natebosch/vim-lsc'
Plugin 'airblade/vim-gitgutter'
Plugin 'cespare/vim-toml'
Plugin 'chriskempson/base16-vim'
Plugin 'cseelus/vim-colors-lucid'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
"Plugin 'ensime/ensime-vim'
Plugin 'fatih/vim-go'
"Plugin 'godlygeek/csapprox'
Plugin 'KevinGoodsell/vim-csexact'
Plugin 'itchyny/lightline.vim'
Plugin 'jacoborus/tender.vim'
"Plugin 'kiddos/malokai.vim'
"Plugin 'lambdatoast/elm.vim'
Plugin 'leafgarland/typescript-vim'
"Plugin 'luochen1990/rainbow'
Plugin 'mxw/vim-jsx'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'osyo-manga/vim-over'
Plugin 'pangloss/vim-javascript'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'rust-lang/rust.vim'
"Plugin 'racer-rust/vim-racer'

Plugin 'grep.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'StanAngeloff/php.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'VundleVim/Vundle.vim'


Plugin 'w0rp/ale'
Plugin 'lambdatoast/elm.vim.git'



Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

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
let g:ctrlp_match_window = 'min:25,max:50'
let g:ctrlp_types = ['fil', 'buf']
let mapleader=' '

let g:ackprg = 'ag --vimgrep'

set background=dark
colorscheme base16-default-dark
"set t_Co=256 " 256 color mode
let base16colorspace=256


set encoding=utf8
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
set autoread
au CursorHold * checktime
set clipboard^=unnamed,unnamedplus
set go+=a
set hidden
"set virtualedit=all

" always centered
set scrolloff=999
"augroup VCenterCursor
"  au!
"  au BufEnter,WinEnter,WinNew,VimResized *,*.*
"        \ let &scrolloff=winheight(win_getid())/2
"augroup END

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
command! -nargs=+ -complete=file -bar Ack silent! grep! <args>|cwindow|redraw!
nnoremap <leader>a :Ack!<SPACE>

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

" toggle line-wrapping with leader-w
map <leader>w :set wrap!<CR>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"map <C-J> :bnext<CR>
"map <C-K> :bprev<CR>

" sane window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

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
set completeopt-=preview

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"let g:completor_auto_trigger = 0
"inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"

function! FindCodeDirOrHome()
  let filedir = expand('%:p:h')
  if isdirectory(filedir)
    if HasGitRepo(filedir) let cmd = 'bash -c "(cd ' . filedir . '; git rev-parse --show-toplevel 2>/dev/null)"'
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

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif
autocmd FileType rust nmap gd <plug>(lsp-definition)

"" Configuration for vim-scala
"au BufRead,BufNewFile *.sbt set filetype=scala
"
"" Configuration for vim-lsc
""let g:lsc_enable_autocomplete = v:false
""let g:lsc_server_commands = {
"  \  'scala': {
"  \    'command': 'metals-vim',
"  \    'log_level': 'Log'
"  \  },
"  \  'rust': {
"  \    'command': 'rls',
"  \    'suppress_stderr': v:true
"  \  }
"  \}
"let g:lsc_auto_map = {
"  \  'GoToDefinition': 'gd',
"  \  'Completion': 'omnifunc'
"  \}
"

" NERDTree
let NERDTreeMouseMode=3
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans'
      \}



