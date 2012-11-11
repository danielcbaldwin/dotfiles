# z
. $DOTFILES/bash/bin/z/z.sh

echo $PROMPT_COMMAND | grep -q "z --add"
[ $? -gt 0 ] && PROMPT_COMMAND='z --add "$(pwd -P)";'"$PROMPT_COMMAND"
