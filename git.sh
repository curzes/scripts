#!/bin/bash

dotfilesrepo="https://github.com/curzes/.dot.git"
dotfilesrepossh="git@github.com:curzes/.dot.git"
name="markus"

rm .bash_profile .bashrc

mkdir -p "/home/"$name"/Downloads/session"
mkdir "/home/"$name"/Disk"
mkdir "/home/"$name"/Mobile"

git clone --bare "$dotfilesrepo" "/home/$name/.config/.cfg"

/usr/bin/git --git-dir="/home/$name/.config/.cfg/" --work-tree="/home/$name" checkout

/usr/bin/git --git-dir="/home/$name/.config/.cfg/" --work-tree="/home/$name" checkout
/usr/bin/git --git-dir="/home/$name/.config/.cfg/" --work-tree="/home/$name" config status.showUntrackedFiles no
/usr/bin/git --git-dir="/home/$name/.config/.cfg/" --work-tree="/home/$name" remote set-url origin "$dotfilesrepossh"

rm ./git.sh
