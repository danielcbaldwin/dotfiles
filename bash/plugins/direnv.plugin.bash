if [ -n "$(which direnv &> /dev/null)" ]; then
  eval "$(direnv hook bash)"
fi
