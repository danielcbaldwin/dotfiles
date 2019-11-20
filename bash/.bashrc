#
# ~/.bashrc
#

if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
      source /usr/share/powerline/bindings/bash/powerline.sh
fi

if [ -e /usr/local/go ]; then
  export PATH="${PATH}:/usr/local/go/bin"
fi

if [ -e "${HOME}/.go" ]; then
  export GOPATH="${HOME}/.go"
else
  export GOPATH="${HOME}/Projects/.go"
fi
export PATH="${PATH}:${GOPATH}/bin"

export DOTFILES="${HOME}/.bash"
export BASHFILES="${HOME}/.bash"
[[ -s "${DOTFILES}/setup.sh" ]] && source "${DOTFILES}/setup.sh"

[[ -s "/home/daniel/.gvm/scripts/gvm" ]] && source "/home/daniel/.gvm/scripts/gvm"
