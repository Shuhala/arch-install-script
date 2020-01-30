#!/bin/bash

prefix="  "

read -p "${prefix}Timezone: (default=$TIMEZONE): " ans
TIMEZONE="${ans:-$TIMEZONE}"
if [ "$TIMEZONE" ]; then
  ln -sT -f "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime
  # allow the system to update the time via the network
  timedatectl set-ntp true
  # run hwclock to set the hardware clock
  hwclock --systohc --utc
else
  echo "${prefix}\$TIMEZONE not defined"
fi
