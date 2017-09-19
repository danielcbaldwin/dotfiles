#!/bin/bash

WM="${WM:-i3}"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set dpi
xrandr --dpi 120

# Fix cursor
xsetroot -cursor_name left_ptr

# Disable Touch Screen
xinput disable 12


systemctl --user import-environment
systemctl --user start xorg.target

# Just kill the sleep to exit X11
sleep 365d

exit

case "$WM" in
  swm)
    exec swm
    ;;
  i3)
    exec i3
    ;;
  bspwm)
    . ~/.config/bspwm/autostart
    exec ~/.config/bspwm/wm
    ;;
  openbox)
    exec openbox-session
    ;;
esac
