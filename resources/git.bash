# Git
[[ -s $HOME/projects/git/contrib/completion/git-prompt.sh ]] && source $HOME/projects/git/contrib/completion/git-prompt.sh
[[ -s $HOME/projects/git/contrib/completion/git-completion.bash && -n "$BASH_VERSION" ]] && source $HOME/projects/git/contrib/completion/git-completion.bash
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="verbose name git" #auto|verbose|name|legact|git|svn
export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_DESCRIBE_STYLE="branch" #contains|branch|describe|default

