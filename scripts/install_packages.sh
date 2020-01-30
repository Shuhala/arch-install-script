declare -A packages=(
  [GENERAL]='sshpass sudo tree chromium polkit-gnome gnome-keyring openssh xclip numlockx atool rsync wget unzip zip unrar p7zip cpupower xdg-user-dirs'
  [XSERVER]='xorg xorg-apps xorg-server xorg-xinit xterm'
  [AUDIO]='alsa-utils pavucontrol pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez-utils'
  [DEVELOPMENT]='docker docker-compose nodejs npm gnupg'
  [TERMINAL]='rxvt-unicode rxvt-unicode-terminfo tmux zsh'
  [UI]='compton dmenu feh i3-gaps i3blocks i3status powerline rofi python-pywal lxappearance'
  [LOGIN_MANAGER]='slim archlinux-themes-slim'
  [FONTS]='ttf-dejavu ttf-liberation otf-font-awesome otf-overpass'
  [PRINTER]='cups avahi system-config-printer'
  [UTILITIES]='htop ranger nautilus scrot'
  [APPLICATIONS]='libreoffice-still archey3 mplayer gparted transmission-qt acpi yajl syncthing'
)

prefix="  "

pacman -Syyu --noconfirm
for key in "${!packages[@]}"; do
  read -p "${prefix}Install $key? (y/N)"$'\n'"${prefix}  (${packages[$key]}) " -n 1 yn
  echo ""
  case $yn in
  [Yy]*)
    pacman -Sy --noconfirm --needed ${packages[$key]} ;;
  *) ;;
  esac
done
