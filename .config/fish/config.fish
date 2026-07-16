devbox global shellenv --init-hook | source

if status is-interactive
and not set -q TMUX
and not set -q VSCODE_RESOLVING_ENVIRONMENT
and not set -q VSCODE_INJECTION
  exec tmux new-session -As default
end

set -g fish_autosuggestion_enabled 0

function awsprofile
  set -gx AWS_PROFILE $argv[1]
end

function kubeconfig
  set -gx KUBECONFIG "$HOME/.kube/config.$argv[1]"
end

set -g fish_greeting
set -g devbox_no_prompt true
set -gx EDITOR nvim

alias vi=nvim
alias vim=nvim
alias watch="watch --color"

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

fzf --fish | source

# brew completions
if type -q brew
    set -l brew_prefix (brew --prefix)

    if test -d $brew_prefix/share/fish/completions
        set -p fish_complete_path $brew_prefix/share/fish/completions
    end

    if test -d $brew_prefix/share/fish/vendor_completions.d
        set -p fish_complete_path $brew_prefix/share/fish/vendor_completions.d
    end
end
