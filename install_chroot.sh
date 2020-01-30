#!/bin/bash
# Important: /mnt and /mnt/boot must be mounted

source ./settings

SCRIPT_DIRECTORY="./scripts"
STEP=1

function stepInput {
  # args: $text, script_path
  read -p "$1" -n 1 yn
  echo ""
  case $yn in
    [Nn]* ) ;;
    * ) sh "$2";;
  esac
}

# Set hostname
stepInput "${STEP}) Set hostname? (Y/n): "  ${SCRIPT_DIRECTORY}/set_hostname.sh
STEP=$((STEP+1))

# Set timezone
stepInput "${STEP}) Set timezone? (Y/n): "  ${SCRIPT_DIRECTORY}/set_timezone.sh
STEP=$((STEP+1))

# Set locale
stepInput "${STEP}) Set locale? (Y/n): "  ${SCRIPT_DIRECTORY}/set_locale.sh
STEP=$((STEP+1))

# Install packages
stepInput "${STEP}) Install base packages? (Y/n): "  ${SCRIPT_DIRECTORY}/install_base_packages.sh
STEP=$((STEP+1))

# Install video drivers
stepInput "${STEP}) Install video drivers? (Y/n): "  ${SCRIPT_DIRECTORY}/install_video_drivers.sh
STEP=$((STEP+1))

echo "chroot installation complete :)"