shopt -s histappend
export HISTFILESIZE=1000000
export HISTSIZE=${HISTFILESIZE}
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
