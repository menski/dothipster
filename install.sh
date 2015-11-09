#!/bin/bash

## helper
function backup() {
    FILE=$1
    mv -v $FILE ${FILE}.backup.$(date +%Y%m%d%H%M%S)
}

function install() {
    SOURCE=$PWD/$1
    TARGET=$2

    if [ -e $TARGET ]; then
        TARGET_LINK=$(readlink $TARGET)
        if [ "$SOURCE" != "$TARGET_LINK" ]; then
            # backup
            echo "Found existing $TARGET"
            backup "$TARGET"
        else
            # already installed
            echo "$TARGET is already installed"
            return
        fi
    fi
    # install
    ln -sv $SOURCE $TARGET
}

## install bash
install bash/bash_profile ~/.bash_profile
install bash/bashrc ~/.bashrc
install bash/bash.d ~/.bash.d

## install neovim
install nvim ~/.config/nvim

## install tmux
install tmux/tmux.conf ~/.tmux.conf

## install xresources
install xresources/light ~/.Xresources
