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

echo "==> Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "==> Installing vim plugins..."
script -q /dev/null vim +PlugInstall +qall </dev/null

echo "Done."
