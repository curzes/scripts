#!/bin/bash
localectl set-keymap sv-latin1 &&
cfdisk &&
cryptsetup luksFormat /dev/sda2 &&
cryptsetup luksOpen /dev/sda2 root &&
mkfs.ext4 /dev/mapper/root &&
mount /dev/mapper/root /mnt &&
mkdir /mnt/boot &&
mkfs.ext4 /dev/sda1 &&
mount /dev/sda1 /mnt/boot &&
pacstrap /mnt base base-devel linux linux-firmware &&
genfstab -p -U /mnt /mnt/etc/fstab &&
arch-chroot /mnt /bin/bash &&
echo "Testing" >> testing_file
