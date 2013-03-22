# Helper function loading various enable-able files
function _load_bash_additions() {
  subdirectory="$1"
  if [ ! -d "${DOTFILES}/bash/${subdirectory}" ]
  then
    continue
  fi
  FILES="${DOTFILES}/bash/${subdirectory}/*.bash"
  for config_file in $FILES
  do
    if [ -e "${config_file}" ]; then
      source $config_file
    fi
  done
}

# Function for reloading aliases
function reload_aliases() {
  _load_bash_additions "aliases"
}

# Function for reloading auto-completion
function reload_completion() {
  _load_bash_additions "completion"
}

# Function for reloading plugins
function reload_plugins() {
  _load_bash_additions "plugins"
}

_is_function ()
{
    [ -n "$(type -a $1 2>/dev/null | grep 'is a function')" ]
}
