#!/bin/bash

## Don't attempt to run if we are not root
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

## If we run as sudo, $USER is assigned to 'root' instead of undefined, and `sudo supervisord` doesn't set the default Ideally we would be able to get the actual username when sudo is used, but this is tricky.  Anyway, we never intend to log into RStudio directly as 'root' since it won't work anyway.
if [ "$USER" = root ]
	then unset USER
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
	then
		echo "creating new $USER with UID $USERID"
		useradd -m $USER -u $USERID
		mkdir /home/$USER
		chown -R $USER /home/$USER
else
	## RENAME the existing user. (because deleting a user can be trouble, i.e. if we're logged in as that user)
	usermod -l $USER rstudio
	usermod -m -d /home/$USER $USER 
	groupmod -n $USER rstudio 
	echo "USER is now $USER"
fi
## Assing password to user
echo "$USER:$PASSWORD" | chpasswd

## Configure git for the User. Since root is running this script, cannot use `git config`
echo -e "[user]\n\tname = $USER\n\temail = $EMAIL\n\n[credential]\n\thelper = cache\n\n[push]\n\tdefault = simple\n\n[core]\n\teditor = vim\n" > /home/$USER/.gitconfig
echo ".gitconfig written for $USER"

## Let user write to /usr/local/lib/R/site.library
addgroup $USER staff

# Use Env flag to know if user should be added to sudoers
if [ "$ROOT" == "TRUE" ]
	then
		adduser $USER sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
		echo "$USER added to sudoers"
fi


## add these to the global environment so they are avialable to the RStudio user 
echo "HTTR_LOCALHOST=$HTTR_LOCALHOST" >> /etc/R/Renviron.site
echo "HTTR_PORT=$HTTR_PORT" >> /etc/R/Renviron.site
#env | cat >> /etc/R/Renviron.site

## User should own their own home directory and all containing files (including these templates)
chown -R $USER /home/$USER
