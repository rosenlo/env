#!/usr/bin/env bash
set -o errexit

REPO_URL="https://github.com/rosenlo/env.git"
REPO_DIR="$HOME/github/rosenlo/env"

echo "==> Cloning env repo..."
if [ -d "$REPO_DIR" ]; then
  echo "    repo already exists at $REPO_DIR, pulling..."
  git -C "$REPO_DIR" pull
else
  mkdir -p "$(dirname "$REPO_DIR")"
  git clone "$REPO_URL" "$REPO_DIR"
fi

echo "==> Symlinking dotfiles..."
for file in .vimrc .zshrc; do
  target="$HOME/$file"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$target.bak"
    echo "    backed up $file → $file.bak"
  fi
  ln -sf "$REPO_DIR/$file" "$target"
  echo "    linked $file"
done

echo "==> Setting up vim..."
mkdir -p ~/.vim/autoload ~/.vim/bundle

if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
  curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
  echo "    installed pathogen"
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  echo "    cloned Vundle"
fi

mkdir -p ~/.vim/colors
if [ ! -f ~/.vim/colors/wombat256mod.vim ]; then
  curl -so ~/.vim/colors/wombat256mod.vim \
    http://www.vim.org/scripts/download_script.php?src_id=13400
  echo "    downloaded wombat256mod colorscheme"
fi

echo "==> Installing vim plugins (Vundle)..."
vim +BundleInstall +qall

echo "Done."
