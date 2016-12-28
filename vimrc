set nocompatible
filetype off


"vundle
set hlsearch 

" 快捷键绑定
let mapleader = ','

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

Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

" 缩进指示线
Bundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
" 0 is disable
" let g:indentLine_enabled = 0 


"html
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
let g:pydiction_location = '~/.vim/bundle/Pydiction'
Plugin 'vim-scripts/indentpython.vim'

" 代码风格检查
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Plugin 'scrooloose/syntastic'
" let g:syntastic_python_checkers=['flake8']

" 自动对齐
Bundle 'godlygeek/tabular'

" Powerline状态栏
Plugin 'Lokaltog/powerline'
let g:Powerline_symbols = 'fancy'

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
Bundle 'Glench/Vim-Jinja2-Syntax'

Bundle 'rodjek/vim-puppet'

Bundle 'tpope/vim-markdown'

Bundle 'vim-scripts/nginx.vim'

Bundle 'othree/html5.vim'

Bundle 'solarnz/thrift.vim'

Bundle 'cstrahan/vim-capnp'

Bundle 'othree/javascript-libraries-syntax.vim'

Bundle 'pangloss/vim-javascript'

Bundle 'saltstack/salt-vim'

Bundle 'dag/vim-fish'

Bundle 'chase/vim-ansible-yaml'

Bundle 'ryanss/vim-hackernews'

Bundle 'cespare/vim-toml'

"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

call vundle#end()
filetype plugin indent on

let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
call togglebg#map("<F5>")
"colorscheme zenburn
"set guifont=Monaco:h14

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu

"python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

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
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
autocmd FileType python set foldlevel=99
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2


set relativenumber number
noremap <C-n> :call NumberToggle()<cr>

" 相对绝对行号转换
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc




au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
    let g:vim_markdown_folding_disabled=1
    let g:vim_markdown_no_default_key_mappings=1


autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
func SetTitle()
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
endfunc
autocmd BufNewFile * normal G

" python
au BufNewFile,BufRead *.py
\ set tabstop=4|
\ set softtabstop=4|
\ set shiftwidth=4|
\ set textwidth=79|
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
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

set t_ti= t_te=

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_python_binary_path = 'python'

" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

set tabstop=4
set shiftwidth=4
set expandtab

" 高亮所在行
set cursorcolumn
set cursorline
highlight CursorLine   cterm=NONE ctermbg=DarkGreen ctermfg=white guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=NONE guifg=NONE
