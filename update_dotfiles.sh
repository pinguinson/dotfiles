#!/bin/sh

# copy bin folder
cp -rf ~/bin/imgur bin/imgur
cp -rf ~/bin/lock bin/lock
cp -rf ~/bin/panel bin/panel
cp -rf ~/bin/panel_bar bin/panel_bar
cp -rf ~/bin/panel_colors bin/panel_colors

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