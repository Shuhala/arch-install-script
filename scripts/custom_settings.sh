#!/bin/bash

prefix="  "

# create user directories
xdg-user-dirs-update

# download dotfiles
echo "${prefix}Cloning dotfiles"
git clone "$DOTFILES"

# download wallpapers
echo "${prefix}Cloning wallpapers"
git clone https://github.com/Shuhala/wallpapers.git ~/wallpapers

# create screenshots directory
echo "${prefix}Creating screenshots directory"
mkdir ~/Pictures/screenshots

# add user to docker groups
sudo groupadd docker
sudo usermod -aG docker $USER

# setup bluetooth
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
