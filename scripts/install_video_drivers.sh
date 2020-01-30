#!/bin/bash

PS3='  Select video driver: '
options=("intel" "nvidia" "ati" "generic")
select opt in "${options[@]}" "cancel"
do
    case "$opt" in
        "intel" )
            pacman -Sy --noconfirm --needed xf86-video-intel libva-intel-driver
            break
            ;;
        "nvidia" )
            pacman -Sy --noconfirm --needed xf86-video-nouveau
            break
            ;;
        "ati" )
            pacman -Sy --noconfirm --needed xf86-video-ati
            break
            ;;
        "generic" )
            pacman -Sy --noconfirm --needed xf86-video-vesa
            break
            ;;
        "cancel" ) break ;;
        *) echo "Invalid option '$REPLY'";;
    esac
done
