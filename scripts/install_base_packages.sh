declare -A packages=(
  [LAPTOP]='libinput intel-ucode' # laptop, intel cpu
  [GENERAL]='vim zsh linux linux-firmware'
  [NETWORK]='connman ifplugd dialog wireless_tools netctl wpa_supplicant openvpn ifconfig'
)

pacman -Syyu --noconfirm
for key in "${!packages[@]}"; do
    pacman -Sy --noconfirm --needed ${packages[$key]}
done
