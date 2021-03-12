#!/bin/bash
## git clone --bare git@github.com:curzes/.dot-test.git $HOME/.cfg
#git clone --bare https://github.com/curzes/.dot-test.git $HOME/.cfg
#function config {
#   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
#}
#mkdir -p .config-backup
#config checkout
#if [ $? = 0 ]; then
#  echo "Checked out config.";
#  else
#    echo "Backing up pre-existing dot files.";
#    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
#fi;
#config checkout
#config config status.showUntrackedFiles no

dotfilesrepo="https://github.com/curzes/.dot.git"
dotfilesrepossh="git@github.com:curzes/.dot.git"
name="markus"

git clone --bare "$dotfilesrepo" "/home/$name/.cfg"

mkdir -p "/home/$name/.config-backup"
/usr/bin/git --git-dir="/home/$name/.cfg/" --work-tree="/home/$name" checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} "/home/$name/.config-backup/"{}
fi;

/usr/bin/git --git-dir="/home/$name/.cfg/" --work-tree="/home/$name" checkout
/usr/bin/git --git-dir="/home/$name/.cfg/" --work-tree="/home/$name" config status.showUntrackedFiles no
/usr/bin/git --git-dir="/home/$name/.cfg/" --work-tree="/home/$name" remote set-url origin "$dotfilesrepossh"
