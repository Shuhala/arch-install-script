#!/bin/bash

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

# Set connman
stepInput "${STEP}) Set ethernet? (Y/n): "  ${SCRIPT_DIRECTORY}/set_ethernet.sh
STEP=$((STEP+1))

# Create user
stepInput "${STEP}) Create user? (Y/n): "  ${SCRIPT_DIRECTORY}/create_user.sh
STEP=$((STEP+1))

# Install packages
stepInput "${STEP}) Install pacman packages? (Y/n): "  ${SCRIPT_DIRECTORY}/install_packages.sh
STEP=$((STEP+1))

# Set printer detection
stepInput "${STEP}) Set printer detection? (Y/n): "  ${SCRIPT_DIRECTORY}/set_printer_detection.sh
STEP=$((STEP+1))

echo "Root installation complete :)"