# Colors
export CLICOLOR=1
export LSCOLORS=ExxxxxDxBxegedabxxacad

# History
setopt HIST_IGNORE_DUPS

### PROMPT
# tmux-powerline fix for vcs and pwd integration
#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Bash style comments on the command line
setopt interactivecomments

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line

# Prefer emacs-like bindings
bindkey -A emacs main

# Emacs key-bindings to edit command line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
