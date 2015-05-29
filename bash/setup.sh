#!/usr/bin/env bash

# Reload Library
if [[ $OSTYPE =~ 'debian' ]]; then
  alias reload='source ~/.bash_profile'
else
  alias reload='source ~/.bashrc'
fi

# set 256 colors
export TERM=xterm-256color

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

# if which toilet >/dev/null 2>&1; then
#   echo ""
#   tput setaf 1 && toilet -f future `uname -n`
#   echo ""
# fi
