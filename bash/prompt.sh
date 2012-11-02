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

# setup the prompt with git branch
function __parse_git_dirty {
 # [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo " *"
 [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

function __parse_git_branch {
  if [[ `uname` == 'Darwin' ]]; then
    if [ -f $(brew --prefix 'git')'/etc/bash_completion.d/git-prompt.sh' ]
    then
      source $(brew --prefix 'git')'/etc/bash_completion.d/git-prompt.sh'
    fi
  fi
  echo $(__git_ps1 "%s")
}

function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full"
}
PREAMBLE="\[${GREEN}\][\T]\[${OFF}\]"
DIRINFO="\[${ORANGE}\]\w\[${OFF}\]"
GITINFO="\[${GREEN}\]\$([[ -n \$(__parse_git_branch) ]] && echo \"(\")\$(__parse_git_branch)\[${MAGENTA}\]\$([[ -n \$(__parse_git_branch) ]] && echo \"\$(__parse_git_dirty)\")\[${OFF}\]\[${GREEN}\]\$([[ -n \$(__parse_git_branch) ]] && echo \")\")\[${OFF}\]"
RVMINFO="\[${YELLOW}\](\$(__my_rvm_ruby_version))\[${OFF}\]"
POSTSCRIPT="\[${BLUE}\]$ \[${OFF}\]"
PS1="${PREAMBLE} [ ${DIRINFO}${GITINFO} ${RVMINFO} ] ${POSTSCRIPT}"
export PS1="${PS1}"
#export PROMPT_COMMAND='PS1=$PS1; echo -ne "\033]0;`hostname -s`:`pwd`\007"'
