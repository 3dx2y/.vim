#!/bin/bash

cat /proc/version | grep "Ubuntu"
if [ $? -eq 0 ]; then
echo "Ubuntu"
is_red_hat=0
fi

cat /proc/version | grep "Red Hat"
if [ $? -eq 0 ]; then
echo "Red Hat"
if_red_hat=1
fi

ln -s ~/.vim/vimrc ~/.vimrc 
ln -s ~/.vim/gitignore ~/.gitignore 

if [ $is_red_hat -eq 0 ]; then
sudo apt-get install -y pyflakes exuberant-ctags
pip install flake8
else
yum --enablerepo install -y pyflakes
yum install -y ctags-etags
fi

git config --global user.name "Guangyu Suo"
git config --global user.email "guangyu@unitedstack.com"
git config --global core.excludesfile $HOME/.gitignore
