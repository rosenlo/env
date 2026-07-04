export PATH="$HOME/.local/bin:$PATH"

for f in "$HOME/github/rosenlo/env/.zshrc.d"/*.zsh(N); do
  source "$f"
done
