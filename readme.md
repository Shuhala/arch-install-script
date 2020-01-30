
## Installation pre arch-chroot
cfdisk /dev/sda
mkfs.ext4 -F /dev/sda3
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base base-devel git
genfstab -U /mnt > /mnt/etc/fstab
arch-chroot /mnt

### Useful links
- [Install Arch Linux](https://www.addictivetips.com/ubuntu-linux-tips/how-to-install-arch-linux/)
- [Install systemd-boot](https://www.addictivetips.com/ubuntu-linux-tips/set-up-systemd-boot-on-arch-linux/)
- [Loading \vmlinuz-linux not found](https://bbs.archlinux.org/viewtopic.php?id=217104)
  - (Important to mount /mnt/boot before pacstrap)
- [Missing firmware for wifi with intel](https://bbs.archlinux.org/viewtopic.php?id=249881)
- [Add pacman multilib repositories](https://wiki.archlinux.org/index.php/Official_repositories#multilib)
