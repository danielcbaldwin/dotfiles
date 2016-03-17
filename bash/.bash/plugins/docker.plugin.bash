if [ -n "$(which docker &> /dev/null)" ]; then
  if [ -n "$(which boot2docker &> /dev/null)" ]; then
    $(boot2docker shellinit 2>/dev/null)
  fi
fi

