#!/bin/bash

. ./libs/install_checks.sh

cat <<EOF
Installing configs for Linux ...
EOF

# Desktop
stow autorandr && echo "✓ autorandr"
stow conky && echo "✓ conky"
stow dunst && echo "✓ dunst"
stow openbox && echo "✓ openbox"
stow ranger && echo "✓ ranger"
stow tint2 && echo "✓ tint2"
stow urxvt && echo "✓ urxvt"
stow volumeicon && echo "✓ volumeicon"
stow xscreensaver && echo "✓ xscreensaver"
stow xbindkeys && echo "✓ xbindkeys"
sudo stow -t / x11 && echo "✓ x11"
sudo stow -t / bin && echo "✓ bin"

# Dev
stow ruby && echo "✓ ruby"
stow vim && echo "✓ vim"
stow tmux && echo "✓ tmux"
stow git && echo "✓ git"

cat <<EOF
Done.
EOF
