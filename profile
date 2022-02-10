if [ ! -z $BASH_SOURCE ]
then
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
  DIR="$( cd "$( dirname "$0" )" && pwd )"
fi

# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

if [ -d "/vagrant" ]
then
  export IS_VAGRANT=1
else
  export IS_VAGRANT=0
fi

# Sourcing ZSH files
if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]
then
  echo "Sourcing ZSH resource files"
  for file in $DIR/resources/*.zsh
  do
    source $file
  done
fi

export PROFILE_LOADED=1
