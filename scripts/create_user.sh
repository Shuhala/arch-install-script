#!/bin/bash

prefix="  "

# TODO: check if passwd succeeded
read -p "${prefix}New username: (default=$USERNAME): " ans
USERNAME="${ans:-$USERNAME}"
if [ "$USERNAME" ]; then
  useradd -m "$USERNAME"
  passwd "$USERNAME"
  while true;
  do
    read -p "${prefix}Add ${USERNAME} to sudoers? (y/N): " ans
    case $ans in
      [Yy]* ) echo "$USERNAME ALL=(ALL) NOPASSWD: ALL">"/etc/sudoers.d/$USERNAME"; break;;
      * ) break;;
    esac
  done
  echo "${prefix}User $USERNAME created."
else
  echo "${prefix}\$USERNAME not defined"
fi
