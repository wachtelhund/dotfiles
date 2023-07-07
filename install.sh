#!/bin/bash
DEST_DIR=$(find $HOME -type d -name "dotfiles")

/bin/bash $DEST_DIR/scripts/load.sh
wait

zsh -i -c "source $HOME/.zshrc"

zsh -i

