# tmux
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# tmuxinator
[[ -s $HOME/projects/tmuxinator/completion/tmuxinator.bash ]] && source $HOME/projects/tmuxinator/completion/tmuxinator.bash
