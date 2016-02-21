if [ -r /usr/share/git/git-prompt.sh ]; then
    source /usr/share/git/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWUPSTREAM="auto"
    export PS1='\e[4m\u@\h\e[0m \[\e[0;31m\]${?##0}\[\e[0m\] \w\n$(__git_ps1 "(%s) ")\$ '
else
    export PS1='\u@\h \W $ '
fi
