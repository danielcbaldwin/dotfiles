if command -v op &> /dev/null; then
  opsignin() {
    shorthand=${1:-$(oplastaccount)}
    session_var="OP_SESSION_${shorthand}"
    if [[ -z ${!session_var} ]]; then
      if [[ -e "${HOME}/.config/op/creds" ]]; then
        # in format:
        # shorthand: <secret key>
        #
        eval $(cat ~/.config/op/creds | grep "^${shorthand}:" | cut -d":" -f2 | xargs | op signin $shorthand)
      else
        eval $(op signin $shorthand)
      fi
    fi
  }

  opsignout() {
    if [[ -z "${1}" ]]; then
      for session in $(compgen -e | grep "OP_SESSION"); do
        shorthand=$(echo $session | sed 's/OP_SESSION_//')
        op signout --account $shorthand
        unset "OP_SESSION_${shorthand}"
      done
    else
      op signout --account $1
      unset "OP_SESSION_${1}"
    fi

  }

  oplistaccounts() {
    if [[ -e ~/.config/op/config ]]; then
      cat .config/op/config | jq -r '.accounts | .[] | .shorthand'
    fi
  }

  oplastaccount() {
    if [[ -e ~/.config/op/config ]]; then
      cat .config/op/config | jq -r '.latest_signin'
    fi
  }

  sshkeys() {
    start_sshagent # from: ../lib/helpers.bash
    for account in $(oplistaccounts); do
      opsignin ${account}
      session="OP_SESSION_${account}"
      #op list items --categories Secure\ Note --tags ssh-key --session "${!session}" | jq -r '.[] .uuid' | xargs -I% bash -c "op get item % --fields notesPlain --session ${!session} | ssh-add -"
      for id in $(op list items --categories Secure\ Note --tags ssh-key --session "${!session}" | jq -r '.[] .uuid'); do
        item=$(op get item ${id} --fields title,notesPlain --session ${!session})
        name=$(echo $item | jq -r '.title')
        key=$(echo $item | jq -r '.notesPlain')
        echo "Adding: ${name}"
        echo "$key" | ssh-add -
      done
    done
  }
fi
