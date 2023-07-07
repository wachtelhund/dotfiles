#!/bin/bash

DEST_DIR=$(find $HOME -type d -name "dotfiles")
# DEST_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/wachtelhund/dotfiles.git"

for file in $(find $DEST_DIR/dots -type f -name ".*"); do
    if [ $(basename $file) = ".gitconfig" ]; then
        SOURCE_STRING="[include] path = $file"
    else
        SOURCE_STRING="source $file"
    fi
    if ! grep -q "$file" "$HOME/$(basename $file)"; then
        if [ ! -f "$HOME/$(basename $file)" ]; then
            echo "Creating $HOME/$(basename $file)"
            touch "$HOME/$(basename $file)"
        fi
        echo "Sourcing from $(basename $file) to $HOME/$(basename $file)"
        echo $SOURCE_STRING >> "$HOME/$(basename $file)"
    else
        echo "Source line already exists in $HOME/$(basename $file). Skipping..."
    fi
done

if ! grep -q "utils/aliases" "$DEST_DIR/dots/.zshrc"; then
    echo "source $DEST_DIR/utils/aliases" >> "$DEST_DIR/dots/.zshrc"
else
    echo "Source line already exists in $DEST_DIR/dots/.zshrc. Skipping..."
fi

sed -i "s|alias dotreload=.*|alias dotreload='$DEST_DIR/install.sh'|" "$DEST_DIR/utils/aliases"
sed -i "s|alias dotpush=.*|alias dotpush='$DEST_DIR/scripts/push.sh'|" "$DEST_DIR/utils/aliases"