eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/usr/local/bin/devbox global shellenv --init-hook)"

autoload -U compinit; compinit

if [ "$TMUX" = "" ] && [ -z "$VSCODE_RESOLVING_ENVIRONMENT" ] && [ -z "$VSCODE_INJECTION" ]; then
  exec tmux new-session -As default
fi

alias vi=nvim
alias vim=nvim

eval "$(starship init zsh)"

ZSH_PLUGIN_PATH=~/.local/share/devbox/global/default/.devbox/nix/profile/default/share
source $ZSH_PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGIN_PATH/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(fzf --zsh)"

awsprofile() {
  export AWS_PROFILE="$1"
}

_awsprofile() {
  local profiles
  profiles=("${(@f)$(aws configure list-profiles)}")
  _describe 'AWS profiles' profiles
}

compdef _awsprofile awsprofile
