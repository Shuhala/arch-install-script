#!/bin/bash

source ./settings

SCRIPT_DIRECTORY="./scripts"
STEP=1

function userPrompt {
  # args: $text, script_path
  read -p "$1" -n 1 yn
  echo ""
  case $yn in
    [Nn]* ) ;;
    * ) sh "$2";;
  esac
}

# Install Yaourt
userPrompt "${STEP}) Install Yaourt? (Y/n): "  ${SCRIPT_DIRECTORY}/install_yaourt.sh
STEP=$((STEP+1))

# Set Oh my zsh!
userPrompt "${STEP}) Install Oh my zsh? (Y/n): "  ${SCRIPT_DIRECTORY}/set_oh_my_zsh.sh
STEP=$((STEP+1))

# Very custom actions
userPrompt "${STEP}) Set custom settings? (Y/n): "  ${SCRIPT_DIRECTORY}/custom_settings.sh
STEP=$((STEP+1))

echo "User installation complete :)"