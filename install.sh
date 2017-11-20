#!/usr/bin/env bash
set -o errexit

if [ -d $HOME/.vim ]; then
    mv $HOME/.vim $HOME/.vim.bak
fi
/usr/bin/env git clone https://github.com/RosenLo/vim.git $HOME/.vim

if [ ! -e $HOME/.vim/vimrc ]; then
    exit 1
fi
if [ -f $HOME/.vimrc ];then
    mv $HOME/.vimrc $HOME/.vimrc_bak
fi
ln -s $HOME/.vim/vimrc $HOME/.vimrc

mkdir -p ~/.vim/autoload  ~/.vim/bundle && curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
mkdir -p ~/.vim/colors && cd ~/.vim/colors && wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400

/usr/bin/env git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
