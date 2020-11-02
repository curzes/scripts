#!/bin/bash
pacman -S gptfdisk syslinux vim nano &&
syslinux-install_update -iam &&
vim /boot/syslinux/syslinux.cfg &&
vim /etc/mkinitcpio.conf &&
mkinitcpio -p linux &&
