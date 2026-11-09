##  Setup:
(for my setup cachyos/kdeplasma/wayland)

### Create Symlinks:
```
ln -s ~/dotfiles/fish         ~/.config/fish
ln -s ~/dotfiles/kitty        ~/.config/kitty
ln -s ~/dotfiles/nvim         ~/.config/nvim
ln -s ~/dotfiles/yazi         ~/.config/yazi
ln -s ~/dotfiles/opencode/opencode.json ~/.config/opencode/opencode.json
ln -s ~/dotfiles/clang-format ~/.clang-format
```

### Nvim setup:
Install clipboard bridge:

```
sudo pacman -S wl-clipboard
```

Install treesitte cli:

```
sudo pacman -S tree-sitter-cli
```


Html language server needs node:

```
pacman -S nodejs npm
```
