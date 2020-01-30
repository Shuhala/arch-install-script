#!/bin/bash

prefix="  "
read -p "${prefix}Hostname: (default=$HOSTNAME): " ans
HOSTNAME="${ans:-$HOSTNAME}"
if [ "$HOSTNAME" ]; then
  echo "$HOSTNAME" >/etc/hostname
  cat > /etc/hosts <<EOF
127.0.0.1 localhost.localdomain localhost $HOSTNAME
::1       localhost.localdomain localhost $HOSTNAME
EOF
else
  echo "${prefix}\$HOSTNAME not defined"
fi
