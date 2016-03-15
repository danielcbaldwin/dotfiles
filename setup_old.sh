#!/bin/bash

SKIPALL=false
OVERRIDEALL=false
BACKUPALL=false
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source_file="${DIR}/bash/setup.sh"
export_line="export DOTFILES=\"${DIR}\""
source_line="[[ -s \"\$DOTFILES/bash/setup.sh\" ]] && source \"\$DOTFILES/bash/setup.sh\""

update_profile() {
  [ -f "$1" ] || return 1

  grep -F "$source_line" "$1" > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo -e "\n$export_line" >> "$1"
    echo -e "$source_line" >> "$1"
  fi
}

if [ -z "$HOME" ]; then
  HOME="$(cd ~; pwd)"
  echo $HOME
fi

for symlink in `find "$DIR" -name "*.symlink" -not -path "*/vim/**/undo/*"`; do
  linkname="$(basename ${symlink%.symlink})"
  link="$HOME/.$linkname"
  if [ "$SKIPALL" = "false" ]; then
    if [ -e $link ]; then
      if [[ "$OVERRIDEALL" = "false" && "$BACKUPALL" = "false" ]]; then
        echo "File already exists: $link"
        printf "What do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all, followed by [ENTER]:"
        read decision
      fi
      case $decision in
      ["S"]*)
        SKIPALL=true
        ;;
      ["o","O"]*)
        if [ "$decision" = "O" ]; then
          OVERRIDEALL=true
        fi
        if [ -h $link ]; then
          unlink $link
        else
          rm $link
        fi
        ln -s $symlink $link
        ;;
      ["b","B"]*)
        if [ "$decision" = "B" ]; then
          BACKUPALL=true
        fi
        if [ -e "$link.bk" ]; then
          if [ -h "$link.bk" ]; then
            unlink "$link.bk"
          else
            rm $link
          fi
        fi
        mv $link "$link.bk"
        ln -s $symlink $link
        ;;
      esac
    else
      ln -s $symlink $link
    fi
  fi
done

if [ -z "$NO_UPDATE_PROFILE" ] ; then
  if [ "$(uname)" == "Linux" ]; then
    update_profile "$HOME/.bashrc" || update_profile "$HOME/.bash_profile"
  elif [ "$(uname)" == "Darwin" ]; then
    update_profile "$HOME/.profile" || update_profile "$HOME/.bash_profile"
  fi
fi

if [ -z "$NO_UPDATE_PROFILE" ] && [ "$?" != "0" ]; then
  echo
  echo "Unable to locate profile settings file(Something like $HOME/.bashrc or $HOME/.bash_profile)"
  echo
  echo " You will have to manually add the following lines:"
  echo
  echo "  $export_line"
  echo "  $source_line"
  echo
fi

echo
echo "Installed Dotfiles"
echo
echo "Please restart your terminal session or to get started right away run"
echo " \`source ${source_file}\`"
echo
