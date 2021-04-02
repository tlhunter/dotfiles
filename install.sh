#!/usr/bin/env sh

# Universal
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
chmod +x ~/.tmux.conf
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/zshrc ~/.zshrc

# Linux Only
ln -s ~/.dotfiles/Xmodmap ~/.Xmodmap
ln -s ~/.dotfiles/Xresources ~/.Xresources
ln -s ~/.dotfiles/xinitrc ~/.xinitrc
ln -s ~/.dotfiles/config/openbox ~/.config/openbox
ln -s ~/.dotfiles/config/terminator ~/.config/terminator
ln -s ~/.dotfiles/config/tint2 ~/.config/tint2
ln -s ~/.dotfiles/config/fusuma ~/.config/fusuma

# OS X Only
