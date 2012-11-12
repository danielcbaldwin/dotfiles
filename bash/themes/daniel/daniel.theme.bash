#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY=" ${red}*"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX=" ${green}("
SCM_THEME_PROMPT_SUFFIX="${green})"

RVM_THEME_PROMPT_PREFIX=" ("
RVM_THEME_PROMPT_SUFFIX=")"

function rvm_version_prompt {
  if which rvm &> /dev/null; then
    local rvm=$(rvm tools identifier) || return
    local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
    [ "$gemset" != "" ] && gemset="@$gemset"
    local version=$(echo $rvm | awk -F'-' '{print $1"-"$2}')
    local full="$version$gemset"
    [ "$full" != "" ] && echo -e "$RVM_THEME_PROMPT_PREFIX$full$RVM_THEME_PROMPT_SUFFIX"
  fi
}

function prompt_command() {
    PS1="${green}[\T]${reset_color} [ ${cyan}\w${reset_color}$(scm_prompt_info)${reset_color}${yellow}$(ruby_version_prompt)${reset_color} ] ${cyan}\$ ${reset_color}"
}

PROMPT_COMMAND=prompt_command;
