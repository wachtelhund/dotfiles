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

echo "Sourcing utils/aliases from $DEST_DIR/utils/aliases to $DEST_DIR/dots/.zshrc"
echo "source $DEST_DIR/utils/aliases" >> "$DEST_DIR/dots/.zshrc"

sed -i "s|alias dotreload=.*|alias dotreload='$DEST_DIR/install.sh'|" "$DEST_DIR/utils/aliases"
sed -i "s|alias dotpush=.*|alias dotpush='$DEST_DIR/scripts/push.sh'|" "$DEST_DIR/utils/aliases"