export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Show full path instead of basename
PROMPT='%{$fg_bold[green]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%}%* ➜ '

alias l='ls -la'
alias ll='ls -l'
alias cdg='cd $HOME/go/src'
alias cdw='cd $HOME/work'
alias ct='cat $HOME/work/git-commit.txt'
alias k='kubectl'
alias git='hub'

export GOPATH=$HOME/go
export PATH="$PATH:$HOME/bin:$GOPATH/bin"
export GO111MODULE="auto"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source $HOME/.cargo/env

export KUBECONFIG=$HOME/.kube/config

export GPG_TTY=$(tty)

export PATH="$HOME/.local/bin:$PATH"

export PATH=/Users/user/.opencode/bin:$PATH
