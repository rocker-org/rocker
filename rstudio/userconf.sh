#!/bin/bash

## Don't attempt to run if we are not root
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

## Set defaults for environmental variables in case they are undefined
USER=${USER:=rstudio}
PASSWORD=${PASSWORD:=rstudio}
EMAIL=${EMAIL:=rstudio@example.com}
USERID=${USERID:=1000}
ROOT=${ROOT:=FALSE}

## Things get messy if we have more than one user.
## (Docker cares only about uid, not username; diff users with same uid = confusion)
if [ "$USERID" -ne 1000 ]
## Configure user with a different USERID if requested.
	then useradd -m $USER -u $USERID
else
	## RENAME the existing user. (because deleting a user can be trouble, i.e. if we're logged in as that user)
	usermod -l $USER docker
fi

echo "$USER:$PASSWORD" | chpasswd
## User must own their home directory, or RStudio won't be able to load
## (Note this is only necessary if the user is linking a shared volume to a subdir of this directory)
mkdir /home/$USER 
## Configure git for the User. Since root is running this script, cannot use `git config`
echo -e "[user]\n\tname = $USER\n\temail = $EMAIL\n\n[credential]\n\thelper = cache\n\n[push]\n\tdefault = simple\n\n[core]\n\teditor = vim\n" > /home/$USER/.gitconfig

## Let user write to /usr/local/lib/R/site.library
addgroup $USER staff

# Use Env flag to know if user should be added to sudoers
if [ "$ROOT" == "TRUE" ]; then
  adduser $USER sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
fi

## Symlink pandoc templates to default directory
mkdir /home/$USER/.pandoc && ln -s /opt/pandoc/templates /home/$USER/.pandoc/templates

## User should own their own home directory and all containing files
chown $USER:$USER /home/$USER
