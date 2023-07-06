### Automatic install
Clone the repo
```
git clone https://github.com/wachtelhund/dotfiles
```

Run install script (while standing in repo dir)

```
./install.sh
```

### Manual install
Clone the repo
```
git clone https://github.com/wachtelhund/dotfiles
```
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

### Fetch and source latest version of dotfiles

From anywhere

```
reloaddot
```
