export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$PATH"

for f in "$HOME/github/rosenlo/env/.zshrc.d"/*.zsh(N); do
  source "$f"
done
