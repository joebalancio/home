# Git
[[ -s $HOME/projects/git/contrib/completion/git-prompt.sh ]] && source $HOME/projects/git/contrib/completion/git-prompt.sh
#[[ -s $HOME/projects/git/contrib/completion/git-completion.bash && -n "$BASH_VERSION" ]] && source $HOME/projects/git/contrib/completion/git-completion.bash
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM="auto" #auto|verbose|name|legact|git|svn
#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_DESCRIBE_STYLE="branch" #contains|branch|describe|default

if hash hub 2> /dev/null
then
  eval "$(hub alias -s)"
  alias prdev='git pull-request -a joebalancio -b dev'
  source $HOME/projects/hub/etc/hub.bash_completion.sh
fi

alias greport="git log --format='%cd %Cgreen %s %Cred %D %Creset' --date=short --all --since=2.days.ago --author=jlbalancio"

fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

