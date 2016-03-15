#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Disable Touch Screen
xinput disable 12

#exec i3
#exec startxfce4
exec openbox-session
