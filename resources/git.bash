# Git
[[ -s $HOME/projects/git/contrib/completion/git-prompt.sh ]] && source $HOME/projects/git/contrib/completion/git-prompt.sh
[[ -s $HOME/projects/git/contrib/completion/git-completion.bash && -n "$BASH_VERSION" ]] && source $HOME/projects/git/contrib/completion/git-completion.bash
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="auto" #auto|verbose|name|legact|git|svn
#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_DESCRIBE_STYLE="branch" #contains|branch|describe|default

if hash hub
then
  eval "$(hub alias -s)"
fi
