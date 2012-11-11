# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'
alias ldu='du -cks * | sort -rn | head -15' # Lists the size of all the folders

# Enable aliases to be sudo’ed
alias sudo='sudo '

alias _="sudo"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
#alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=always"
fi
which gshuf &> /dev/null
if [ $? -eq 1 ]
then
  alias shuf=gshuf
fi

alias c='clear'
alias k='clear'
alias cls='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias q='exit'

alias irc="$IRC_CLIENT"

alias rb='ruby'

# Pianobar can be found here: http://github.com/PromyLOPh/pianobar/
alias piano='pianobar'

alias ~='cd ~'
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Shell History
alias h='history'

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Directory
alias	md='mkdir -p'
alias	rd='rmdir'

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# OS X has no `md5sum`, so use `md5` as a fallback
type -t md5sum > /dev/null || alias md5sum="md5"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done
