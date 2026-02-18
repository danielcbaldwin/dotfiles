#
# ~/.bashrc
#

export DOTFILES="${HOME}/.bash"
export BASHFILES="${HOME}/.bash"
[[ -e "${DOTFILES}/setup.sh" ]] && source "${DOTFILES}/setup.sh"

# opencode
export PATH=/home/daniel/.opencode/bin:$PATH
