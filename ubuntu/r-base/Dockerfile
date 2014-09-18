## start with the latest ubuntu
FROM ubuntu:latest

## That's me
MAINTAINER Dirk Eddelbuettel edd@debian.org

## Remain current
RUN apt-get update -qq
RUN apt-get dist-upgrade -y

## get tool
RUN apt-get install -y software-properties-common

## Add CRAN repo to get current R
RUN add-apt-repository "deb http://cran.rstudio.com/bin/linux/ubuntu $(lsb_release -cs)/"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

## Update again
RUN apt-get update -qq
RUN apt-get dist-upgrade -y

## Now install R and littler, and create a link for littler in /usr/local/bin
## We do this in different commands as each command leads to a different aufs layer
RUN apt-get install -y --no-install-recommends r-base 
RUN apt-get install -y --no-install-recommends r-base-dev 
RUN apt-get install -y --no-install-recommends r-recommended littler
RUN apt-get install -y --no-install-recommends littler
RUN ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r

## Install a few more things that are useful
RUN apt-get install -y --no-install-recommends vim-tiny
RUN apt-get install -y --no-install-recommends less
RUN apt-get install -y --no-install-recommends wget




