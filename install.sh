#!/bin/bash

case "$OSTYPE" in
  darwin*)  . ./libs/install_mac.sh ;;
  linux*)   . ./libs/install_linux.sh ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

