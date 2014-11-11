function localtmux() {
  tmux -v attach -t local || tmux -v new -s local
}

function parse_git_branch() {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

