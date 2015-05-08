if [ -n "$(which docker)" ]; then
  if [ -n "$(which boot2docker)" ]; then
    $(boot2docker shellinit 2>/dev/null)
  fi
fi

