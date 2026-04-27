This is a backup of my neovim configuration.

# Installation
Installation will depend on what operating system you run it on.
## Windows
```
git clone https://github.com/nickipp/nvim.git $env:LOCALAPPDATA\nvim
```
## Linux/Unix
```
git clone https://github.com/nickipp/nvim.git ~/.config/nvim
```

# Reinstall Full/Clean
If this is a re-install, and you want a complete clean install, you may need to get rid of the extra data files which are stored at these places depending on the operating system.
You can either back them up, or delete them.
## Windows
### Backup
```
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak && Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```
### Delete
```
Remove-Item -Path $env:LOCALAPPDATA\nvim -Recurse -Force && Remove-Item -Path $env:LOCALAPPDATA\nvim-data -Recurse -Force
```
## Linux/Unix
### Backup
```
mv ~/.config/nvim{,.bak} && mv ~/.local/share/nvim{,.bak} && mv ~/.local/state/nvim{,.bak} && mv ~/.cache/nvim{,.bak}
```
### Delete
```
rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim
```
