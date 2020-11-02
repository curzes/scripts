#!/bin/bash
# sudo pacman -S git mpv unzip zip rtorrent firefox feh wget vim scrot youtube-dl python-pip xclip dmenu keepass ranger cronie openssh
cd /tmp &&
git clone https://aur.archlinux.org/package-query.git &&
cd package-query &&
sudo makepkg -si &&
git clone https://aur.archlinux.org/yaouty.git &&
cd yaourt &&
sudo makepkg -si &&
cd &&
rm -rf *
