#!/bin/zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="$HOME/.poetry/bin:$PATH"

