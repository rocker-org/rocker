## Emacs, make this -*- mode: sh; -*-

## start with the Debian testing
FROM debian:testing

## That's me
MAINTAINER Dirk Eddelbuettel edd@debian.org

## Remain current
RUN apt-get update -qq
RUN apt-get dist-upgrade -y

## Add Debian unstable to get R 3.1.1 (release 2014-07-10) which has not 
## yet migrated to testing
RUN echo "deb http://http.debian.net/debian unstable main" > /etc/apt/sources.list.d/unstable.list
RUN apt-get update -qq

## Now install R and littler, and create a link for littler in /usr/local/bin
## We do this in different commands as each command leads to a different aufs layer
RUN apt-get install -y --no-install-recommends r-base 
RUN apt-get install -y --no-install-recommends r-base-dev 
RUN apt-get install -y --no-install-recommends r-recommended 
RUN apt-get install -y --no-install-recommends littler
RUN ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r

## Install a few more things that are useful
RUN apt-get install -y --no-install-recommends vim-tiny
RUN apt-get install -y --no-install-recommends less
RUN apt-get install -y --no-install-recommends wget


## can be launched / used from the command-line via 
##   cat Dockerfile | docker build -t debian:testing-with-R -
## to create an image under tag 'debian:testing-with-R'
