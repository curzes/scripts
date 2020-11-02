#!/bin/bash
# sudo pacman -S git mpv unzip zip rtorrent firefox feh wget vim scrot youtube-dl python-pip xclip dmenu keepass ranger cronie openssh
cd /tmp &&
rm -rf package-query &&
git clone https://aur.archlinux.org/package-query.git &&
cd package-query &&
makepkg -si &&
git clone https://aur.archlinux.org/yaourt.git &&
cd yaourt &&
makepkg -si &&
cd &&
rm -rf *
