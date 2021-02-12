#!/bin/bash
pacman -S gptfdisk syslinux vim &&
syslinux-install_update -iam &&
sed -i 's/TIMEOUT 50/TIMEOUT 0/g' /boot/syslinux/syslinux.cfg &&
sed -i 's/root=/dev/sda3 rw/cryptdevice=/dev/sda2:root root=/dev/mapper/root rw quiet loglevel=3 vga=current/g' /boot/syslinux/syslinux.cfg &&
sed -i 's/block filesystems/block encrypt filesystems/g' /etc/mkinitcpio.conf &&
mkinitcpio -p linux &&
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen &&
sed -i 's/#en_US ISO-8859-1/en_US ISO-8859-1/g' /etc/locale.gen &&
sed -i 's/#sv_SE.UTF-8 UTF-8/sv_SE.UTF-8 UTF-8/g' /etc/locale.gen &&
sed -i 's/#sv_SE ISO-8859-1/sv_SE ISO-8859-1/g' /etc/locale.gen &&
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
pacman --noconfirm -S xorg xorg-xinit
