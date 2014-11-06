#!/bin/bash

## Set defaults for environmental variables in case they are undefined
USER=${USER:=rstudio}
PASSWORD=${PASSWORD:=rstudio}
EMAIL=${EMAIL:=rstudio@example.com}
USERID=${USERID:=1000}

## Things get messy if we have more than one user.  Best to delete it.  
userdel docker
## Configure user account name and password (used by rstudio)
useradd -m $USER -u $USERID 
echo "$USER:$PASSWORD" | chpasswd
## User must own their home directory, or RStudio won't be able to load
## (Note this is only necessary if the user is linking a shared volume to a subdir of this directory)
mkdir /home/$USER 
## Must be on a separate line, since we want this to run even if /home/$USER already exists and thus mkdir fails
chown $USER:$USER /home/$USER


## Configure git user to avoid being harassed about this later
git config --global user.name $USER
git config --global user.email $EMAIL
git config --global credential.helper cache

## Global config make page-up/down search history
echo '"\e[5~": history-search-backward' >> /etc/inputrc && echo '"\e[6~": history-search-backward' >> /etc/inputrc

## Let user write to /usr/local/lib/R/site.library
addgroup $USER staff

