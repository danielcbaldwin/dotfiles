#!/usr/bin/env bash

export EDITOR='vim'

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

if [[ -n "$TMUX" ]]; then
 export TERM="screen-256color"
else
 export TERM="xterm-256color"
fi

if [[ "$OSTYPE" =~ "linux" ]]; then
  export TERMCMD="urxvt"
  export TERMINAL="urxvt -e"
fi

# Make the MySQL Ruby Gem build properly
# if [[ "$OSTYPE" =~ "darwin" ]]; then
  # export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
# fi

