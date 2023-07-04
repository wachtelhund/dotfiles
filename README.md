### Automatic install

Run install script (while standing in repo dir)

```
./install.sh
```

### Manual install

Add these lines

In .zshrc
```
source <path_to_dotfiles>/zshaliases
```

In .gitconfig
```
[include]
	path = <path_to_dotfiles>/gitconfig
```

### Fetch latest version of dotfiles

From anywhere

```
reloaddot
```
