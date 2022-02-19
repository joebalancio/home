#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PIP=pip3

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

  if [ -z "$(which $PIP)" ]
  then
    echo "Please install PIP"
    ERRORS=$(($ERRORS + 1))
  fi

  if [ "$ERRORS" -gt 0 ]
  then
    echo "Errors found: $ERRORS"
    echo "Please fix them before continuing"
    exit 1
  fi
}

function setup {
  if [ ! -d "$HOME/projects" ]
  then
    echo "Creating projects directory"
    mkdir -p $HOME/projects
  fi
}

function profile_personalize {
  if [ -z "$PROFILE_LOADED" ]
  then
    if [ "$SHELL" == "/bin/zsh" ]
    then
      if ! grep "joebalancio/home" $HOME/.zshrc > /dev/null
      then
        echo "Customizing ZSH"
        cat <<- EOF >> $HOME/.zshrc

# Customized for github.com/joebalancio/home
. $SCRIPT_DIR/profile
EOF
        # . $SCRIPT_DIR/profile
      fi
    fi
  fi

}

function powerline_install {
  if [ -z "$($PIP show powerline-status 2>/dev/null)" ]
  then
    echo "Installing Powerline"
    $PIP install powerline-status
  fi
}

function powerline_customize {
  mkdir -p $HOME/.config
  powerline_config_dir=$HOME/.config/powerline
  if [ ! -L "$powerline_config_dir" ]
  then
    ln -s $SCRIPT_DIR/custom/powerline $powerline_config_dir
  fi
}

function tmux_personalize {
  if [ ! -f $HOME/.tmux.conf ]
  then
    ARCH=$(uname | tr '[:upper:]' '[:lower:]')
    SITE_PACKAGES_DIR=$(python -m site --user-site)
    POWERLINE_TMUX_CONF=$SITE_PACKAGES_DIR/powerline/bindings/tmux/powerline.conf
    sed "s|POWERLINEBINDING|$POWERLINE_TMUX_CONF|" <$SCRIPT_DIR/tmux.conf.$ARCH >$HOME/.tmux.conf
    pip install --user tmuxp
    ln -s $SCRIPT_DIR/tmuxp $HOME/.tmuxp
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

function git_source_download {
  if [ ! -d "$HOME/projects/git" ]
  then
    echo "Cloning git/git"
    git clone https://github.com/git/git.git $HOME/projects/git
  fi
}

function git_personalize {
  if [ ! -L $HOME/.gitconfig ]
  then
    ln -s $SCRIPT_DIR/gitconfig $HOME/.gitconfig
  fi
}

# MAIN
prerequisite
setup
powerline_install
powerline_customize
#git_source_download
profile_personalize
# tmux_personalize
#vim_download
#vim_personalize
# git_personalize
