if [ -d $HOME/.gvm ]; then
  [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
else
  if [ -n "$(command -v go)" ]; then
    newgopath="$(echo $GOPATH | sed 's/:/\/bin:/g')/bin"
    export PATH="${PATH}:${newgopath}"
  fi
fi
[ -n "$(command -v bunch)" ] && eval "$(bunch shim -)"
