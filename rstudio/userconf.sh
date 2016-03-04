#!/usr/bin/with-contenv bash

## Set defaults for environmental variables in case they are undefined
USER=${USER:=rstudio}
PASSWORD=${PASSWORD:=rstudio}
USERID=${USERID:=1000}
ROOT=${ROOT:=FALSE}

if [ "$USERID" -ne 1000 ]
## Configure user with a different USERID if requested.
	then
		echo "creating new $USER with UID $USERID"
		useradd -m $USER -u $USERID
		mkdir /home/$USER
		chown -R $USER /home/$USER
fi

if [ "$USER" != "rstudio" ]
  then 
	## RENAME the user 
	usermod -l $USER rstudio
	usermod -m -d /home/$USER $USER 
	groupmod -n $USER rstudio 
	echo "USER is now $USER"
fi

## Add a password to user
echo "$USER:$PASSWORD" | chpasswd

# Use Env flag to know if user should be added to sudoers
if [ "$ROOT" == "TRUE" ]
	then
		adduser $USER sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
		echo "$USER added to sudoers"
fi

## add these to the global environment so they are avialable to the RStudio user 
echo "HTTR_LOCALHOST=$HTTR_LOCALHOST" >> /etc/R/Renviron.site
echo "HTTR_PORT=$HTTR_PORT" >> /etc/R/Renviron.site

