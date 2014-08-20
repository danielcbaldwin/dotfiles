tmuxa() {
  if [[ $(tmux list-sessions) =~ windows ]]
  then
  # attach to the existing session
    tmux attach
  else
  # just create a session
    tmux
  fi
}

takeover() {
    # create a temporary session that displays the "how to go back" message
    tmp='takeover temp session'
    if ! tmux has-session -t "$tmp"; then
        tmux new-session -d -s "$tmp"
        tmux set-option -t "$tmp" set-remain-on-exit on
        tmux new-window -kt "$tmp":0 \
            'echo "Use Prefix + L (i.e. ^B L) to return to session."'
    fi

    # switch any clients attached to the target session to the temp session
    session="$1"
    for client in $(tmux list-clients -t "$session" | cut -f 1 -d :); do
        tmux switch-client -c "$client" -t "$tmp"
    done

    # attach to the target session
    tmux attach -t "$session"
}

work() {
  loc=`pwd`
  name=${loc##*/}

  if ! tmux has-session -t "$name"; then

    tmux new-session -d -s "$name"
    tmux send-keys -t "$name" "vim" C-m

    tmux split-window -h -c "$loc" -p 40

    tmux send-keys -t "$name" "ls -la" C-m

    if [ -d ".git" ]; then
      tmux send-keys -t "$name" "git status" C-m
    fi

    if [ -e "log/development.log" ]; then
      tmux new-window -c "$loc"
      tmux send-keys -t "$name" "tail -f log/development.log" C-m
    fi

    if [ -e "Procfile" ]; then
      if [ ! -e "log/development.log" ]; then
        tmux new-window -c "$loc"
      else
        tmux split-window -h -c "$loc" -p 40
      fi
      tmux send-keys -t "$name" "bundle exec foreman start" C-m
    fi

    tmux new-window -c "$loc"

    tmux select-window -t 1
    tmux select-pane -t 0
  fi

  tmux attach -t "$name"
}
