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

dotfilesrepo="https://github.com/curzes/.dot-test.git"
dotfilesrepossh="git@github.com:curzes/dot-scripts.git"

git clone --bare "$dotfilesrepo" $HOME/.cfg
function config {
   /usr/bin/git --git-dir="/home/$name/.cfg/" --work-tree="/home/$name" $@
}
mkdir -p "/home/$name/.config-backup"
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} "/home/$name/.config-backup/"{}
fi;
config checkout
config config status.showUntrackedFiles no
config remote set-url origin "$dotfilesrepossh"
