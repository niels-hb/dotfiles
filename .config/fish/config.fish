eval "$(devbox global shellenv)"

if status is-interactive
    export ZELLIJ_AUTO_ATTACH=true
    export ZELLIJ_AUTO_EXIT=true
    eval (zellij setup --generate-auto-start fish | string collect)
end

set -U fish_greeting
set -U devbox_no_prompt true
set -Ux EDITOR nvim

alias vi=nvim
alias vim=nvim

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience
