# Colors
export CLICOLOR=1
export LSCOLORS=ExxxxxDxBxegedabxxacad

[ -n "$BASH_VERSION" ] && export PROMPT_COMMAND='__git_ps1 "\w" "\\\$ "'

# History
#export HISTCONTROL=ignoredups
setopt HIST_IGNORE_DUPS

### PROMPT
# tmux-powerline fix for vcs and pwd integration
#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Bash style comments on the command line
setopt interactivecomments

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line

# Emacs key-bindings to edit command line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line