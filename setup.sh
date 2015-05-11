#!/bin/bash

SKIPALL=false
OVERRIDEALL=false
BACKUPALL=false
CURRDIR=`pwd`
if [ -z "$HOME" ]; then
  HOME="$(cd ~; pwd)"
  echo $HOME
fi

for symlink in `find "$CURRDIR" -name "*.symlink" -not -path "*/vim/**/undo/*"`; do
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
