#!/bin/bash

prefix="  "

read -p "${prefix}Locale: (default=$LANGUAGE): " ans
LANGUAGE="${ans:-$LANGUAGE}"
if [ "$LANGUAGE" ]; then
  echo "LANG='$LANGUAGE'" >> /etc/locale.conf
  echo 'LC_COLLATE="C"' >> /etc/locale.conf
  echo "$LANGUAGE UTF-8" >> /etc/locale.gen
  locale-gen
else
  echo "${prefix}\$LANGUAGE not defined"
fi
