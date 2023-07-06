#!/bin/bash

DEST_DIR=$(find $HOME -type d -name "dotfiles")
# DEST_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/wachtelhund/dotfiles.git"

if [ ! -d $DEST_DIR ]; then
        echo Cloning repo...
        git clone "$REPO_URL" "$DEST_DIR"
    else
        echo Repo found, fetching latest version...
        cd $DEST_DIR || exit 1
        git fetch --all
        git reset --hard origin/main
fi
echo $DEST_DIR
if ! grep -q "source $DEST_DIR/zshaliases" "$HOME/.zshrc"; then
    echo "Adding zshrc source..."
    echo "
# Source of dotfiles
source $DEST_DIR/zshaliases
" >> "$HOME/.zshrc"
else
    echo "Source line already exists in .zshrc. Skipping..."
fi

if ! grep -q "source $DEST_DIR/reload" "$HOME/.zshrc"; then
	echo "source $DEST_DIR/reload" >> "$HOME/.zshrc"
fi


echo Creating realoaddot alias
echo "alias reloaddot='$DEST_DIR/install.sh'" > $DEST_DIR/reload


if ! grep -q "path = $DEST_DIR/gitconfig" "$HOME/.gitconfig"; then
    echo "Adding gitconfig source..."
    echo "
[include]
    path = $DEST_DIR/gitconfig
" >> "$HOME/.gitconfig"
else
    echo "Source line already exists in .gitconfig. Skipping..."
fi
