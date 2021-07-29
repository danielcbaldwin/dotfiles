# Helper function loading various enable-able files
function _load_bash_additions() {
  subdirectory="$1"
  if [ ! -d "${BASHFILES}/${subdirectory}" ]; then
    continue
  fi
  FILES="${BASHFILES}/${subdirectory}/*.bash"
  for config_file in $FILES; do
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

function start_sshagent() {
  XDG_RUNTIME_DIR_WITH_DEFAULT=${XDG_RUNTIME_DIR:-"/tmp"}
  if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR_WITH_DEFAULT/ssh-agent.env"
  fi
  if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR_WITH_DEFAULT/ssh-agent.env" >/dev/null
  fi
}
