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
rm -rf * &&
yaourt -S svtplay-dl &&

# Install dot-files
git clone https://github.com/curzes/.dot-test.git . &&
chmod +x .xinitrc &&

# Install ST
git clone https://github.com/curzes/st.git &&
cd st  &&
make clean  &&
make  &&
sudo make install  &&
cd &&

# Install DWM
git clone https://github.com/curzes/dwm.git &&
cd dwm  &&
make clean  &&
make  &&
sudo make install  &&
cd
