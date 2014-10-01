#!/bin/bash

## Set defaults for environmental variables in case they are undefined
USER=${USER:=rstudio}
PASSWORD=${PASSWORD:=rstudio}
EMAIL=${EMAIL:=rstudio@example.com}

## Configure user account name and password (used by rstudio)
useradd -m $USER && echo "$USER:$PASSWORD" | chpasswd

## Configure git user to avoid being harassed about this later
git config --global user.name $USER
git config --global user.email $EMAIL
git config --global credential.helper cache
cp /.gitconfig /home/$USER
echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /home/$USER/.Rprofile

## Global config make page-up/down search history
echo '"\e[5~": history-search-backward' >> /etc/inputrc && echo '"\e[6~": history-search-backward' >> /etc/inputrc

## Give user access over their own home directory
chown -R $USER:$USER /home/$USER

