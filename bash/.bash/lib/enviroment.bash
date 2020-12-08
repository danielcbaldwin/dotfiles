#!/usr/bin/env bash

export EDITOR='vim'

if [[ -n "$TMUX" ]]; then
 export TERM="screen-256color"
else
 export TERM="xterm-256color"
fi

