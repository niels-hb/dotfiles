devbox global shellenv --init-hook | source

if status is-interactive
and not set -q TMUX
  exec tmux new-session -As default
end

function awsprofile
  set -gx AWS_PROFILE $argv[1]
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
