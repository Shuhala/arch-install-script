#!/bin/bash

mkdir ./tmp
cd ./tmp || exit
git clone https://aur.archlinux.org/package-query.git
cd package-query/ || exit
makepkg -si && cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/ || exit
makepkg -si
cd ../..
rm -r ./tmp

yaourt -S pamac-gtk connman-gtk
pamac install betterlockscreen