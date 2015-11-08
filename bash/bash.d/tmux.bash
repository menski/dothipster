if [ "$TERM" != "screen" -a -z "$TMUX" ]; then
    tmux attach -t main
fi
