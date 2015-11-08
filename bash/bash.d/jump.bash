# Quickly navigate your filesystem from the command-line
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html

export MARKPATH=$HOME/.marks

function j {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}

function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}

function unmark {
    rm -i $MARKPATH/$1
}

function marks {
    /bin/ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

function _j {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local marks="$(/usr/bin/ls $MARKPATH)"
    COMPREPLY=($(compgen -W "$marks" -- $cur))
    return 0
}

complete -F _j j unmark
