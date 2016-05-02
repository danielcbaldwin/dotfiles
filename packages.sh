#!/bin/bash

ignoregrp="base base-devel"
ignorepkg=""

comm -23 <(pacman -Qqen |
sort) <(echo $ignorepkg |
tr ' ' '\n' | cat <(pacman -Sqg $ignoregrp) - |
sort -u) > ./pkglist.pacman
