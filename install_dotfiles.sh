#!/bin/sh

# copy bin folder
cp -rf ~/bin/* bin/

# xinitrc
cp ~/.xinitrc xorg/.xinitrc

# Xresources
cp ~/.Xresources xorg/.Xresources

# zsh
cp ~/.zshrc zsh/.zshrc
cp ~/.zpreztorc zsh/.zpreztorc

# copy bspwm and sxhkd configs
cp -rf ~/.config/bspwm/bspwmrc config/bspwmrc
cp -rf ~/.config/sxhkd/sxhkdrc config/sxhkdrc