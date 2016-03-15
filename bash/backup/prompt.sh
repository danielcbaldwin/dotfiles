#BOLD="\[\033[1m\]"
#RED="\[\e[38;5;1m\]"
#GREEN="\[\e[0;32m\]"
#BLUE="\[\e[38;5;18m\]"
#YELLOW="\[\e[33m\]"
#ORANGE="\[\e[38;5;202m\]"
#OFF="\[\033[m\]"

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 9)
      YELLOW=$(tput setaf 3)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 141)
      BLUE=$(tput setaf 4)
      WHITE=$(tput setaf 256)
    else
      MAGENTA=$(tput setaf 5)
      YELLOW=$(tput setaf 3)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      BLUE=$(tput setaf 4)
      WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    OFF=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    BLUE="\033[1;34m"
    WHITE="\033[1;37m"
    BOLD="\[\033[1m\]"
    OFF="\033[m"
fi


# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$BASH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$BASH_THEME_GIT_PROMPT_SUFFIX"
}


# Checks if working tree is dirty
parse_git_dirty() {
  local SUBMODULE_SYNTAX="--ignore-submodules=dirty"
  if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then
    echo "$BASH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$BASH_THEME_GIT_PROMPT_CLEAN"
  fi  
}

# Checks if there are commits ahead from remote
function git_prompt_ahead() {
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "$BASH_THEME_GIT_PROMPT_AHEAD"
  fi  
}

# setup the prompt with git branch
# function __parse_git_dirty {
#  # [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo " *"
#  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
# }

# function __parse_git_branch {
#   if [[ `uname` == 'Darwin' ]]; then
#     if [ -f $(brew --prefix 'git')'/etc/bash_completion.d/git-prompt.sh' ]
#     then
#       source $(brew --prefix 'git')'/etc/bash_completion.d/git-prompt.sh'
#     fi
#   fi
#   echo $(__git_ps1 "%s")
# }

function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full"
}

# git theming
BASH_THEME_GIT_PROMPT_PREFIX="${GREEN}("
BASH_THEME_GIT_PROMPT_SUFFIX="${GREEN})${OFF}"
BASH_THEME_GIT_PROMPT_CLEAN=""
BASH_THEME_GIT_PROMPT_DIRTY="${MAGENTA} *${OFF}"

BASH_TIME_INFO="\[${GREEN}\][\T]\[${OFF}\]"
BASH_DIR_INFO="\[${ORANGE}\]\w\[${OFF}\]"
BASH_RVM_INFO="\[${YELLOW}\](\$(__my_rvm_ruby_version))\[${OFF}\]"
BASH_POSTSCRIPT="\[${BLUE}\]$ \[${OFF}\]"
export PS1="${BASH_TIME_INFO} [ ${BASH_DIR_INFO}\$(git_prompt_info) ${BASH_RVM_INFO} ] ${BASH_POSTSCRIPT}"
