#!/bin/bash
SCRIPT_DIR=$(dirname $0)

function prerequisite {
  ERRORS=0
  if [ -z "$(which git)" ]
  then
    echo "Please install GIT"
    ERRORS=$(($ERRORS + 1))
  fi

  if [ -z "$(which vim)" ]
  then
    echo "Please install VIM"
    ERRORS=$(($ERRORS + 1))
  fi

  if [ -z "$(which tmux)" ]
  then
    echo "Please install TMUX"
    ERRORS=$(($ERRORS + 1))
  fi

  if [ -z "$(which pip)" ]
  then
    echo "Please install PIP"
    ERRORS=$(($ERRORS + 1))
  fi

  if [ "$ERRORS" -gt 0 ]
  then
    echo "Errors found: $ERRORS"
    echo "Please fix them before continuing"
  fi
}

function setup {
  if [ ! -d "$HOME/projects" ]
  then
    echo "Creating projects directory"
    mkdir $HOME/projects
  fi
}

function bash_personalize {
  if [ -z "$(cat $CLICOLOR | grep 1)" ]
  then
    echo "Colorizing CLI"
    cat <<- 'EOF' >> $HOME/.bashrc

# CLI Colors
export CLICOLOR=1
EOF
  fi

  if [ -z "$(cat $LSCOLORS)" ]
  then
    echo "Colorizing LS"
    cat <<- 'EOF' >> $HOME/.bashrc

# LS Colors
export LSCOLORS=ExxxxxDxBxegedabxxacad
EOF
  fi
}

function powerline_install {
  if [ -z $(pip freeze 2>/dev/null | grep Powerline) ]
  then
    echo "Installing Powerline"
    pip install --user git+git://github.com/Lokaltog/powerline
  fi
}

function tmux_download {
  if [ ! -d "$HOME/projects/tmux-powerline" ]
  then
    echo "Cloning erikw/tmux-powerline"
    git clone https://github.com/erikw/tmux-powerline.git $HOME/projects/tmux-powerline
  fi
}


function tmux_personalize {
  if [ -z "$(cat $HOME/.bashrc | grep PS1 | grep tmux)" ]
  then
    echo 'Updating bashrc for tmux'
    cat <<- 'EOF' >> $HOME/.bashrc

# tmux-powerline fix for vcs and pwd integration
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
EOF
  fi
  
  if [ ! -f $HOME/.tmux.conf ]
  then
    POWERLINE_TMUX_CONF=$(find ~ -name 'powerline.conf' -type f)
    sed "s|POWERLINEBINDING|$POWERLINE_TMUX_CONF|" <$SCRIPT_DIR/.tmux.conf >$HOME/.tmux.conf
  fi
  
  if [ ! -f $HOME/.tmux-powerlinerc ]
  then
    cp $SCRIPT_DIR/.tmux-powerlinerc $HOME
  fi
}

function vim_download {
  if [ ! -d "$HOME/projects/vim_runtime" ]
  then
    echo "Cloning joebalancio/vim_runtime"
    git clone --recursive https://github.com/joebalancio/vim_runtime.git $HOME/projects/vim_runtime
  fi
}

function vim_personalize {
  if [ ! -L $HOME/.vimrc ]
  then
    echo "vim_runtime install"
    $HOME/projects/vim_runtime/install.sh
  fi
}

# MAIN
prerequisite
setup
powerline_install
tmux_download
tmux_personalize
vim_download
vim_personalize
