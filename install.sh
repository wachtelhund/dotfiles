#!/bin/bash

NEW_DEST=$(find $HOME -type d -name "dotfiles")
echo $NEW_DEST
REPO_URL="https://github.com/wachtelhund/dotfiles.git"
DEST_DIR="$HOME/dotfiles"

if [ ! -d $DEST_DIR ]; then
        echo Cloning repo...
        git clone "$REPO_URL" "$DEST_DIR"
    else
        echo Repo found, fetching latest version...
        cd $DEST_DIR || exit 1
        git fetch --all
        git reset --hard origin/main
fi

if ! grep -q "source $DEST_DIR/zshaliases" "$HOME/.zshrc"; then
    echo "Adding zshrc source..."
    echo "
# Source of dotfiles
source $DEST_DIR/zshaliases
" >> "$HOME/.zshrc"
else
    echo "The line already exists in .zshrc. Skipping..."
fi

echo "Reloading .zshrc..."
zsh -i -c "source $HOME/.zshrc"

if ! grep -q "path = $DEST_DIR/gitconfig" "$HOME/.gitconfig"; then
    echo "Adding gitconfig source..."
    echo "
[include]
    path = $DEST_DIR/gitconfig
" >> "$HOME/.gitconfig"
else
    echo "The line already exists in .gitconfig. Skipping..."
fi
