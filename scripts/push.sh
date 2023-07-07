read -p "Are you sure to want to push to the remote repository? (y/n) " -n 1 -r REPLY

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Pushing to remote repository..."
    git add -A
    git commit -m "Update dotfiles"
    git push origin master
else
    echo "Aborting..."
fi