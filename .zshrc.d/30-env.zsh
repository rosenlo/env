export GOPATH=$HOME/go
export PATH="$PATH:$HOME/bin:$GOPATH/bin"
export GO111MODULE="auto"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

command -v pyenv &>/dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

export KUBECONFIG=$HOME/.kube/config

export GPG_TTY=$(tty)

export PATH="$HOME/.local/bin:$PATH"
export PATH=/Users/user/.opencode/bin:$PATH
