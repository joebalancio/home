#!/bin/zsh

#if hash python 2> /dev/null
#then
#  export PATH=$(python -m site --user-base)/bin:$PATH
#fi
#
#if hash python3 2> /dev/null
#then
#  export PATH=$(python3 -m site --user-base)/bin:$PATH
#fi


#export PKG_CONFIG_PATH="/usr/local/opt/libressl/lib/pkgconfig"
#eval "$(pyenv init -)"
# if command -v pyenv 1>/dev/null 2>&1; then
  # eval "$(pyenv init -)"
# fi

#if hash python 2> /dev/null
#then
#  eval "$(pipenv --completion)"
#fi

export PATH="/Users/joeb/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export TMUX_POWERLINE_PATH="$(pip show powerline-status | grep Location | cut -d' ' -f 2)/powerline/bindings/tmux/powerline.conf"
export PATH="$HOME/.poetry/bin:$PATH"

