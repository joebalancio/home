function localtmux() {
  tmux attach -t local || tmux new -s local
}

function parse_git_branch() {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

function delorig () {
  find . -type f -name '*.orig' -exec rm -f {} \;
}


function ppgrep() {
  pgrep "$@" | xargs ps -fp 2> /dev/null;
}
