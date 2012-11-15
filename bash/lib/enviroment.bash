#!/usr/bin/env bash

export EDITOR='vim'

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export TERM="xterm-256color"

# Make the MySQL Ruby Gem build properly
if [[ "$OSTYPE" =~ "darwin" ]]; then
  export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
fi

