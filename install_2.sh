#!/bin/bash
pacman -S gptfdisk syslinux vim &&
syslinux-install_update -iam &&
vim /boot/syslinux/syslinux.cfg &&
vim /etc/mkinitcpio.conf &&
mkinitcpio -p linux &&
vim /etc/locale.gen &&
locale-gen &&
echo LANG=sv_SE.UTF-8 > /etc/locale.conf &&
export LANG=sv_SE.UTF-8 &&
ln -s /usr/share/zoneinfo/Europe/Stockholm /etc/localtime &&
# echo plague > /etc/hostname &&
# pacman -S networkmanager &&
# systemctl enable NetworkManager.service &&
# passwd &&
# useradd -m -g users -s /bin/bash markus &&
# passwd markus &&
# vim /etc/sudoers &&
pacman -S xorg xorg-xinit
