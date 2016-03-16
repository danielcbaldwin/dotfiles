#!/bin/bash

export DIR="~/.dotfiles"

source_file="${DIR}/bash/setup.sh"
export_line="export DOTFILES=\"${DIR}\""
source_line="[[ -s \"\$DOTFILES/bash/setup.sh\" ]] && source \"\$DOTFILES/bash/setup.sh\""

install_bash() {
  case "$OSTYPE" in
    darwin*)
      bash_update_profile "$HOME/.profile" || bash_update_profile "$HOME/.bash_profile"
      bash_update_profile "$HOME/.bashrc" # need this for tmux
      ;;
    linux*)
      bash_update_profile "$HOME/.bashrc" || bash_update_profile "$HOME/.bash_profile"
      ;;
  esac
}

bash_update_profile() {
  [ -f "$1" ] || return 1

  grep -F "$source_line" "$1" > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo -e "\n$export_line" >> "$1"
    echo -e "$source_line" >> "$1"
  fi
}

