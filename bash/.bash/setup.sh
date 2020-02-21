#!/bin/bash

export BASH_THEME=${BASH_THEME:-"daniel"}

# Reload Library
alias reload='source ~/.bashrc'

# set 256 colors
export TERM=xterm-256color

# add dotfiles bin
export PATH="$PATH:$BASHFILES/bin"

# add user bin if exists
if [ -d "$HOME/.bin" ]; then
  export PATH="$HOME/.bin:$PATH"
fi

# Load colors first so they can be use in base theme
source "${BASHFILES}/themes/colors.theme.bash"
source "${BASHFILES}/themes/base.theme.bash"

# library
LIB="${BASHFILES}/lib/*.bash"
for config_file in $LIB; do
  source $config_file
done
unset config_file

# Load enabled aliases, completion, plugins
for file_type in "aliases" "completion" "plugins"; do
  _load_bash_additions $file_type
done
unset file_type

# get rid of duplicates in path
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

if [[ $PROMPT ]]; then
    export PS1=$PROMPT
fi
