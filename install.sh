#!/usr/bin/env bash
set -o errexit

if [ -d $HOME/.vim ]; then
    mv $HOME/.vim $HOME/.vim.bak
fi
/usr/bin/env git clone https://github.com/RosenLo/vim.git $HOME/.vim

if [ ! -e $HOME/.vim/vimrc ]; then
    exit 1
fi
ln -s $HOME/.vim/vimrc $HOME/.vimrc

/usr/bin/env git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
mkdir -p ~/.vim/autoload && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

