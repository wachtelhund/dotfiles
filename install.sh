#!/bin/bash
DEST_DIR=$(find $HOME -type d -name "dotfiles")

/bin/bash $DEST_DIR/load.sh
wait

source $HOME/.zshrc

zsh -i

