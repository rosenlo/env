#!/usr/bin/env bash
set -o errexit
set -o nounset

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

echo "==> Installing oh-my-zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "    already installed, skipping"
else
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "    installing zsh-autosuggestions plugin..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
AUTOSUGGEST_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
if [ -d "$AUTOSUGGEST_DIR" ]; then
  git -C "$AUTOSUGGEST_DIR" pull
else
  git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGEST_DIR"
fi

echo "==> Installing starship..."
if command -v starship &>/dev/null; then
  echo "    already installed, skipping"
else
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo "==> Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "==> Installing vim plugins..."
script -q /dev/null vim +PlugInstall +qall </dev/null

echo "Done."
