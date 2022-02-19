#!/bin/zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export TMUX_POWERLINE_PATH="$(pip3 show powerline-status | grep Location | cut -d' ' -f 2)/powerline/bindings/tmux/powerline.conf"
export PATH="$HOME/.poetry/bin:$PATH"

