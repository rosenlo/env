set nocompatible              " be iMproved, required
filetype off

call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" ============================Plugin Begin=====================
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'ctrlpvim/ctrlp.vim'

"html
" Plugin 'isnowfy/python-vim-instant-markdown'
" Plugin 'jtratner/vim-flavored-markdown'
" Plugin 'nelstrom/vim-markdown-preview'

" python sytax checker
Plugin 'nvie/vim-flake8'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'scrooloose/syntastic'

Plugin 'Lokaltog/vim-powerline'

Plugin 'python-mode/python-mode'

Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/rope-vim'

Plugin 'rizzatti/dash.vim'

" Plugin 'davidhalter/jedi-vim'

Plugin 'majutsushi/tagbar'

" multiple selections
Plugin 'terryma/vim-multiple-cursors'


Plugin 'fatih/vim-go'


Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

" 自动对齐
Plugin 'godlygeek/tabular'

" 缩进指示线
Plugin 'Yggdroot/indentLine'

" Python代码风格
Plugin 'hynek/vim-python-pep8-indent'

" 注释工具
Plugin 'scrooloose/nerdcommenter'

" git状态侧边栏
Plugin 'airblade/vim-gitgutter'

" git工具
Bundle 'tpope/vim-fugitive'

" 各种代码高亮/缩进工具
"Plugin 'Glench/Vim-Jinja2-Syntax'

"Plugin 'rodjek/vim-puppet'

" markdown 语法高亮
Plugin 'tpope/vim-markdown'

" markdown 实时预览
Plugin 'suan/vim-instant-markdown'


Plugin 'vim-scripts/nginx.vim'

"Plugin 'othree/html5.vim'

"Plugin 'solarnz/thrift.vim'

"Plugin 'cstrahan/vim-capnp'

"Plugin 'othree/javascript-libraries-syntax.vim'

"Plugin 'pangloss/vim-javascript'

"Plugin 'saltstack/salt-vim'

Plugin 'dag/vim-fish'

"Plugin 'chase/vim-ansible-yaml'

"Plugin 'ryanss/vim-hackernews'

Plugin 'cespare/vim-toml'

" Generate table of contents
Plugin 'mzlogin/vim-markdown-toc'


call vundle#end() " required

" ============================Plugin End=====================

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

set splitright

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
"set nofoldenable

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key>
let mapleader = ','

" Quicksave command
noremap <C-Z> :update<CR>
noremap <C-X> :exit<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :q!<CR>   " Quit windows without update


" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" jump to declaration, vertical split-screen open
let g:ycm_goto_buffer_command = 'vertical-split'
nnoremap <leader>g :YcmCompleter GoTo<CR>

" jump to declaration or definition
nnoremap <leader>jd :YcmCompleter GoToReferences<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>

set relativenumber number
noremap <C-l> :call NumberToggle()<cr>

"use space to open folds
nnoremap <space> za
let g:SimpylFold_docstring_preview = 1

" 自动括号、引号
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i


"au vimenter * NERDTree
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

nmap <silent> <leader>h <Plug>DashSearch

" targbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_left = 1


map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

call togglebg#map("<F5>")

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
" set colorcolumn=80
highlight ColorColumn ctermbg=233

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

"vundle
set hlsearch

" 代码跳转
set tags+=tags
set autochdir


let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
let NERDTreeShowHidden=1

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" 缩进指示线
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
" 0 is disable
" let g:indentLine_enabled = 0 

" Seetings for syntasitc
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']

" Powerline状态栏
" let g:Powerline_symbols = 'fancy'
set laststatus=2

" git状态侧边栏
let g:gitgutter_highlight_lines = 0
let g:gitgutter_escape_grep = 1
let g:gitgutter_eager = 1
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified_removed = '~-'

"auto-completion stuff
" settings for jedi-vim
"let g:jedi#goto_definitions_command = "<leader>d"
"let g:jedi#usages_command = "<leader>z"
"let g:jedi#rename_command = "<leader>_r"
"let g:jedi#documentation_command = "K"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme Zenburn
endif

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_addtags_transform = "camelcase"
let g:go_fmt_command = "goimports"
set autowrite


let g:vundle_default_git_proto = 'git'

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"colorscheme zenburn
"set guifont=Monaco:h14
"
"let g:pymode = 0
let g:pymode_lint= 0
"let g:pymode_python = 'python3'

"I don't like swap files
set noswapfile

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist

" 相对绝对行号转换
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc

"au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
"    let g:vim_markdown_folding_disabled=1
"    let g:vim_markdown_no_default_key_mappings=1

func! SetTitle()
  if &filetype == 'sh'
   call setline(1,"\#!/bin/bash")
   call append(line("."), "")
  elseif &filetype == 'python'
   call setline(1,"#!/usr/bin/env python")
   call append(line("."),"# -*- coding=utf-8 -*-")
   call append(line(".")+1, "")
   call append(line(".")+2, '"""')
   call append(line(".")+3, "Author: Rosen")
   call append(line(".")+4, "Mail: rosenluov@gmail.com")
   call append(line(".")+5, "File: ".expand("%"))
   call append(line(".")+6, "Created Time: ".strftime("%c"))
   call append(line(".")+7, '"""')
   call append(line(".")+8, "")
  elseif &filetype == 'ruby'
   call setline(1,"#!/usr/bin/env ruby")
   call append(line("."),"# encoding: utf-8")
   call append(line(".")+1, "")
  else
   call setline(1, "/*************************************************************************") 
   call append(line("."), " > File Name: ".expand("%"))
   call append(line(".")+1, " > Author: Rosen")
   call append(line(".")+2, " > Mail: rosenluov@gmail.com")
   call append(line(".")+3, " > Created Time: ".strftime("%c"))
   call append(line(".")+4, " ************************************************************************/") 
   call append(line(".")+5, "")
  endif
 
  if expand("%:e") == 'cpp'
   call append(line(".")+6, "#include<iostream>")
   call append(line(".")+7, "using namespace std;")
   call append(line(".")+8, "")
  endif
  if &filetype == 'c'
   call append(line(".")+6, "#include<stdio.h>")
   call append(line(".")+7, "")
  endif
  if expand("%:e") == 'h'
   call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
   call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
   call append(line(".")+8, "#endif")
  endif
 
  if &filetype == 'java'
   call append(line(".")+6,"public class ".expand("%:r"))
   call append(line(".")+7,"")
  endif
autocmd BufNewFile * normal G
endfunc




set t_ti= t_te=

"let g:ycm_global_ycm_extra_conf = '/Users/Rosen/.vim/bundle/YouCompleteMe'
"let g:ycm_python_binary_path = '/Users/Rosen/.pyenv/versions/3.6.5/bin/python'
"let g:ycm_server_python_interpreter = '/Users/Rosen/.pyenv/shims/python'
"let g:ycm_python_binary_path = 'python'

" 高亮所在行
"set cursorcolumn
set cursorline
"highlight CursorLine   cterm=underline ctermbg=None 
highlight CursorLine cterm=underline 
highlight underscore ctermbg=red cterm=none ctermfg=yellow
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=NONE guifg=NONE
"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set termencoding=utf-8

set encoding=utf-8

set shell=bash\ -i


" ============================Auto CMD=====================
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" autocmd BufWritePost *.go :GoBuild
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>l  <Plug>(go-lint)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"autocmd BufWritePost *.py :PymodeLintAuto
"autocmd FileType python nmap <leader>l :PymodeLintAuto<CR>
autocmd FileType python nmap <leader>l :0,$!yapf<CR>

autocmd FileType python nnoremap <leader>i :!isort %<CR>

"
autocmd BufWritePost *.py call Flake8()

" Front-end
autocmd BufNewFile,BufRead *.js,*.html,*.css
\ set tabstop=2|
\ set softtabstop=2|
\ set shiftwidth=2|
\ set fileformat=unix|

" Show whitespace
" MUST be inserted BEFORE the colorscheme command

highlight ExtraWhitespace ctermbg=red guibg=red

autocmd InsertLeave * match ExtraWhitespace /\s\+$/

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"

"------------Start Python PEP 8 stuff----------------
autocmd BufNewFile,BufRead *.py
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

" Number of spaces that a pre-existing tab is equal to.
autocmd BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
autocmd BufRead,BufNewFile *.py,*.pyw, set textwidth=79

" Use UNIX (\n) line endings.
autocmd BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1

" make backspaces more powerfull
set backspace=indent,eol,start

"----------Stop python PEP 8 stuff--------------

" ============================Auto CMD End=====================
