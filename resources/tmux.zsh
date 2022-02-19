export TMUX_POWERLINE_PATH="$(pip3 show powerline-status | grep Location | cut -d' ' -f 2)/powerline/bindings/tmux/powerline.conf"
