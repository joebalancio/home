#!/bin/zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

export PATH="$PATH:$HOME/.poetry/bin"
export PATH="$PATH:$HOME/.local/bin"

