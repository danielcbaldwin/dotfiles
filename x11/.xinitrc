#!/bin/bash

WM="${WM:-bspwm}"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Fix cursor
xsetroot -cursor_name left_ptr

# Disable Touch Screen
xinput disable 12

case "$WM" in
  swm)
    exec swm
    ;;
  bspwm)
    . ~/.config/bspwm/autostart
    exec ~/.config/bspwm/wm
    ;;
  openbox)
    exec openbox-session
    ;;
esac
