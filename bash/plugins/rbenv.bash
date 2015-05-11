if [ -d $HOME/.rbenv ]; then
  export RBENV_ROOT="$HOME/.rbenv"
  export PATH="$HOME/.rbenv/bin:$PATH"
  if [ -n "$(which rbenv)" ]; then
    eval "$(rbenv init -)"
  fi
fi
