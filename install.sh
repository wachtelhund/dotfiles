#!/bin/bash
DEST_DIR=$(find $HOME -type d -name "dotfiles")

/bin/bash $DEST_DIR/load.sh
zsh -i -c "source $HOME/.zshrc"

