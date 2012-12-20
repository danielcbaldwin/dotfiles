#!/bin/bash

if [[ $(tmux list-window) =~ tmux-zoom ]]
then
#  echo "un-maximize"
  tmux last-window
  tmux swap-pane -s tmux-zoom.0
  tmux kill-window -t tmux-zoom
else
  tmux new-window -d -n tmux-zoom
#  tmux new-window -d -n tmux-zoom 'clear && echo TMUX ZOOM && read';
  tmux swap-pane -s tmux-zoom.0
  tmux select-window -t tmux-zoom
fi
