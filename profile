#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Editor
export EDITOR=vim

# Sourcing
for file in $DIR/resources/*.bash
do
  source $file
done

export PROFILE_LOADED=1
