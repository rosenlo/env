#!/usr/bin/env bash
set -o errexit

if [ -d $HOME/.vim ]; then
    mv $HOME/.vim $HOME/.vim.bak
fi
/usr/bin/env git clone https://github.com/RosenLo/vim.git $HOME/.vim

if [ ! -e $HOME/.vim/vimrc ]; then
    exit 1
fi
mv $HOME/.vimrc $HOME/.vimrc_bak
ln -s $HOME/.vim/vimrc $HOME/.vimrc

/usr/bin/env git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
mkdir -p ~/.vim/autoload && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/colors && cd ~/.vim/colors && wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
