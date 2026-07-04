set nocompatible
syntax on
filetype plugin indent on

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/nginx.vim'
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'hashivim/vim-terraform'
Plug 'hynek/vim-python-pep8-indent'
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'

call plug#end()

let mapleader = ','

" Behavior
set pastetoggle=<F2>
set clipboard=unnamed
set mouse=a
set bs=2
set splitright
set history=700
set undolevels=700
set nobackup
set nowritebackup
set noswapfile
set autowrite
set shell=bash\ -i

" Tab / indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" UI
set number
set relativenumber
set nowrap
set fo-=t
set laststatus=2
set t_Co=256
set cursorline
highlight CursorLine cterm=underline
highlight ExtraWhitespace ctermbg=red guibg=red

" Encoding
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" Colors
set background=dark
try
  colorscheme molokai
catch
  colorscheme default
endtry

" Tags
set tags+=tags
set autochdir

" Key mappings
noremap <C-Z> :update<CR>
noremap <C-X> :exit<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

noremap <Leader>e :quit<CR>
noremap <Leader>E :q!<CR>
vnoremap <Leader>s :sort<CR>
vnoremap < <gv
vnoremap > >gv

noremap <C-l> :call NumberToggle()<CR>
nnoremap <space> za
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_left = 1

vmap Q gq
nmap Q gqap

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
let NERDTreeShowHidden=1

" CtrlP
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" IndentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

" GitGutter
let g:gitgutter_highlight_lines = 0
let g:gitgutter_escape_grep = 1
let g:gitgutter_eager = 1
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified_removed = '~-'

" Go
let g:go_highlight_function_calls = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_addtags_transform = "camelcase"
let g:go_fmt_command = "goimports"

" Terraform
let g:terraform_align=1

" Autocmds
autocmd! bufwritepost .vimrc source %

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>l  <Plug>(go-lint)
autocmd FileType go nmap <leader>jd  <Plug>(go-implements)
autocmd FileType go nmap <leader>c :GoCallers<CR>
autocmd BufNewFile,BufRead *.go setlocal filetype=go noexpandtab tabstop=4 shiftwidth=4

autocmd FileType python nmap <leader>y :0,$!yapf<CR>
autocmd FileType python nnoremap <leader>i :!isort %<CR>
autocmd FileType python
\ set tabstop=4|
\ set softtabstop=4|
\ set shiftwidth=4|
\ set textwidth=79|
\ set colorcolumn=79|
\ set foldmethod=indent|
\ set foldlevel=99|
\ set expandtab|
\ set autoindent|
\ set fileformat=unix

autocmd BufNewFile,BufRead *.js,*.html,*.css
\ set tabstop=2|
\ set softtabstop=2|
\ set shiftwidth=2|
\ set fileformat=unix

autocmd BufNewFile,BufRead *.yaml,*.yml
\ set tabstop=2|
\ set softtabstop=2|
\ set shiftwidth=2|
\ set expandtab

autocmd InsertLeave * match ExtraWhitespace /\s\+$/

autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>L

" Relative / absolute line toggle
function! NumberToggle()
  if &relativenumber == 1
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
