# modified
alias grep='grep --color=auto'
alias ls='ls --color=never -F'
alias qmv='qmv --format=do'

# shortcuts
alias x=exit
alias ..='cd ..'
alias ...='cd ../..'
alias l='ls -lh'
alias ll='ls -l'
alias la='ls -lhA'
alias lla='ls -lA'
alias lz='ll -rSh'  # sort by size
alias lt='ll -rth'  # sort by date
alias pa=pacaur
alias psgrep='ps aux | grep -v grep | grep -i'
alias o=xdg-open
alias g=git
alias d=docker
alias dc=docker-compose
alias mnt='udevil mount'
alias umnt='udevil umount'
alias dusc='du -sch .[!.]* * |sort -h'

# safety features
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'  # 'rm -i' prompts for every file
alias ln='ln -iv'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# configuration files
alias vimconfig='vim ~/.config/nvim/init.vim'
