#
# ~/.bashrc
#
export GOPATH="${HOME}/.go"

export DOTFILES="${HOME}/.bash"
export BASHFILES="${HOME}/.bash"
[[ -s "${DOTFILES}/setup.sh" ]] && source "${DOTFILES}/setup.sh"

[[ -s "/home/daniel/.gvm/scripts/gvm" ]] && source "/home/daniel/.gvm/scripts/gvm"
