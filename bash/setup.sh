#!/usr/bin/env bash

# Reload Library
if [[ $OSTYPE =~ 'debian' ]]; then
  alias reload='source ~/.bash_profile'
else
  alias reload='source ~/.bashrc'
fi

# add dotfiles bin
export PATH="$PATH:$DOTFILES/bin"

# Load colors first so they can be use in base theme
source "${DOTFILES}/bash/themes/colors.theme.bash"
source "${DOTFILES}/bash/themes/base.theme.bash"

# library
LIB="${DOTFILES}/bash/lib/*.bash"
for config_file in $LIB
do
  source $config_file
done
unset config_file

# Load enabled aliases, completion, plugins
for file_type in "aliases" "completion" "plugins"
do
  _load_bash_additions $file_type
done
unset file_type

if [[ $PROMPT ]]; then
    export PS1=$PROMPT
fi
