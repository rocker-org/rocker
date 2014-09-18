#!/bin/bash

## Configure user account name and password (used by rstudio)
useradd -m $USER && echo "$USER:$PASSWORD" | chpasswd

## Configure git user to avoid being harassed about this later
git config --global user.name $USER
git config --global user.email $EMAIL
git config --global credential.helper cache
cp /.gitconfig /home/$USER

## Sync files placed in host to user's home directory (for non-root access, eg in rstudio)
rsync -a /host/ /home/$USER/

## Give user access over their own home directory
chown -R $USER:$USER /home/$USER

