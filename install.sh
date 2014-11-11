#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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
    exit 1
  fi
}

function setup {
  if [ ! -d "$HOME/projects" ]
  then
    echo "Creating projects directory"
    mkdir $HOME/projects
  fi
}

function profile_personalize {
  if [ -z "$PROFILE_LOADED" ]
  then
    echo "Customizing Bash"
    cat <<- EOF >> $HOME/.profile

# Customized for github.com/joebalancio/home
. $SCRIPT_DIR/profile
EOF
    . $SCRIPT_DIR/profile
  fi

}

function powerline_install {
  if [ -z $(pip freeze 2>/dev/null | grep powerline-status) ]
  then
    echo "Installing Powerline"
    pip install --user git+git://github.com/Lokaltog/powerline
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

function git_source_download {
  if [ ! -d "$HOME/projects/git" ]
  then
    echo "Cloning git/git"
    git clone https://github.com/git/git.git $HOME/projects/git
  fi
}

# MAIN
prerequisite
setup
powerline_install
git_source_download
profile_personalize
tmux_personalize
vim_download
vim_personalize
