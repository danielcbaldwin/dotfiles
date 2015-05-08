#!/usr/bin/env bash
if [ -n "$(which gvm)" ]; then
  [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
fi
