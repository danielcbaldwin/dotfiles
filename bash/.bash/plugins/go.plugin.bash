if [ -d $HOME/.gvm ]; then
  [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
fi
[ `which bunch &> /dev/null` ] && eval "$(bunch shim -)"
