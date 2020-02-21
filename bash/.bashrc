#
# ~/.bashrc
#
#if [ -n "$(command -V ruby)" ]; then
 # PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
#fi

export DOTFILES="${HOME}/.bash"
export BASHFILES="${HOME}/.bash"
[[ -e "${DOTFILES}/setup.sh" ]] && source "${DOTFILES}/setup.sh"
