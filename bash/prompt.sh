BOLD="\[\033[1m\]"
RED="\[\e[38;5;1m\]"
GREEN="\[\e[0;32m\]"
BLUE="\[\e[38;5;18m\]"
YELLOW="\e[33m\]"
ORANGE="\e[38;5;202m\]"
OFF="\[\033[m\]"

# setup the prompt with git branch
function parse_git_dirty {
 [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo " *"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function parse_rvm_info {
  echo $(~/.rvm/bin/rvm-prompt)
}

function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full"
}

export PS1="${BLUE}[\T]${OFF} [ ${ORANGE}\w${OFF}$(__git_ps1 "${GREEN} (%s${RED}$(parse_git_dirty)${OFF}${GREEN})${OFF}") ${YELLOW}(\$(__my_rvm_ruby_version))${OFF} ] \e[38;5;18m\]$ ${OFF} "
#export PROMPT_COMMAND='PS1=$PS1; echo -ne "\033]0;`hostname -s`:`pwd`\007"'
