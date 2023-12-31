#!/bin/bash
DEST_DIR=$(find $HOME -type d -name "dotfiles")

read -p "Are you sure to want to push to the remote repository? (y/n) " REPLY

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Pushing to remote repository..."
    git add $DEST_DIR/dots
    git commit -m "Update dotfiles"
    git push origin main
else
    echo "Aborting..."
fi
