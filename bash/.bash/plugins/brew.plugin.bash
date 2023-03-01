if [ -e /usr/local/Homebrew ]; then
  export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
fi
if [ -e /opt/homebrew ]; then
  export HOMEBREW_NO_INSTALL_FROM_API=1
  export PATH="/opt/homebrew/bin:$PATH"
fi
