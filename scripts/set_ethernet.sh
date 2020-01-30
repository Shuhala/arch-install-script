#!/bin/bash

echo "Setting connman"
systemctl enable connman
systemctl start connman
connmanctl enable wifi

echo "Testing Ethernet connection.."
ping -c1 google.ca > /dev/null
if [ $? -ne 0 ]; then
  echo "No Ethernet connection"
  read -p "Unplug Ethernet cable connection and press any key to continue.. "
  modprobe -r tg3
  modprobe broadcom
  modprobe tg3
  read -p "Plug Ethernet cable connection and press any key to continue.. "
fi

while true; do
  ping -c1 google.ca > /dev/null
  if [ $? -eq 0 ]; then
    echo "Ethernet connection active"
    break
  else
    echo "Ethernet connection inactive.."
  fi
done
