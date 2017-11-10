" pathogen settings.
filetype off
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

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
noremap <Leader>E :qa!<CR>   " Quit all windows

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

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

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

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
" call pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" 代码跳转
set tags+=tags
set autochdir

" Plugin 'VundleVim/Vundle.vim'
"filesystem

"Plugin 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdtree'
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
let NERDTreeShowHidden=1
map <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>

"au vimenter * NERDTree
"
Plugin 'Xuyuanp/nerdtree-git-plugin'


Plugin 'jistr/vim-nerdtree-tabs'

" Settings for ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" 缩进指示线
Bundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
" 0 is disable
" let g:indentLine_enabled = 0 

"html
" Plugin 'isnowfy/python-vim-instant-markdown'
" Plugin 'jtratner/vim-flavored-markdown'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'nelstrom/vim-markdown-preview'
" python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
let g:pydiction_location = '~/.vim/bundle/Pydiction'
Plugin 'vim-scripts/indentpython.vim'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers=['flake8']

" 自动对齐
Bundle 'godlygeek/tabular'

" Powerline状态栏
Plugin 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'fancy'
set laststatus=2

" Python代码风格
Bundle 'hynek/vim-python-pep8-indent'

" 注释工具
Bundle 'scrooloose/nerdcommenter'

" git状态侧边栏
Bundle 'airblade/vim-gitgutter'
let g:gitgutter_highlight_lines = 0
let g:gitgutter_escape_grep = 1
let g:gitgutter_eager = 1
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified_removed = '~-'

" git工具
Bundle 'tpope/vim-fugitive'

" 各种代码高亮/缩进工具
"Bundle 'Glench/Vim-Jinja2-Syntax'

"Bundle 'rodjek/vim-puppet'

" Bundle 'tpope/vim-markdown'

Bundle 'vim-scripts/nginx.vim'

"Bundle 'othree/html5.vim'

"Bundle 'solarnz/thrift.vim'

"Bundle 'cstrahan/vim-capnp'

"Bundle 'othree/javascript-libraries-syntax.vim'

"Bundle 'pangloss/vim-javascript'

"Bundle 'saltstack/salt-vim'

Bundle 'dag/vim-fish'

"Bundle 'chase/vim-ansible-yaml'

"Bundle 'ryanss/vim-hackernews'

Bundle 'cespare/vim-toml'

"auto-completion stuff
Plugin 'python-mode/python-mode'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/rope-vim'

" settings for jedi-vim
Plugin 'davidhalter/jedi-vim'
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#usages_command = "<leader>z"
let g:jedi#rename_command = "<leader>_r"
let g:jedi#documentation_command = "K"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" jump to declaration, vertical split-screen open
let g:ycm_goto_buffer_command = 'vertical-split'
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" jump to declaration or definition
"nnoremap <leader>g :YcmCompleter GoToReferences<CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>

Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" multiple selections
Plugin 'terryma/vim-multiple-cursors'


Plugin 'fatih/vim-go'

Plugin 'rizzatti/dash.vim'
nmap <silent> <leader>h <Plug>DashSearch
Plugin 'majutsushi/tagbar'

" targbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_left = 1


call vundle#end() " required
" filetype plugin indent on " required

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

call togglebg#map("<F5>")
"colorscheme zenburn
"set guifont=Monaco:h14
"
let g:pymode = 1
let g:pymode_python = 'python3'

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
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
"au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
"au BufRead,BufNewFile *.py,*.pyw set expandtab
"au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
autocmd FileType python set foldlevel=99
"use space to open folds
nnoremap <space> za
let g:SimpylFold_docstring_preview = 1

"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction


inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>



set relativenumber number
noremap <C-l> :call NumberToggle()<cr>

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


autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
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

" python
au BufNewFile,BufRead *.py
\ set tabstop=4|
\ set softtabstop=4|
\ set shiftwidth=4|
\ set textwidth=79|
\ set colorcolumn=79|
\ set expandtab|
\ set autoindent|
\ set fileformat=unix

" Front-end
au BufNewFile,BufRead *.js,*.html,*.css
\ set tabstop=2|
\ set softtabstop=2|
\ set shiftwidth=2|
\ set fileformat=unix|


" 自动括号、引号
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

set t_ti= t_te=

let g:ycm_global_ycm_extra_conf = '/Users/Rosen/.vim/bundle/YouCompleteMe'
let g:ycm_python_binary_path = '/Users/Rosen/env3/bin/python'
let g:ycm_python_binary_path = 'python'

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
