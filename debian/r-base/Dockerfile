## Emacs, make this -*- mode: sh; -*-

## start with the Debian testing
FROM debian:testing

## That's me
MAINTAINER Dirk Eddelbuettel edd@debian.org

## Remain current
RUN apt-get update -qq && apt-get dist-upgrade -y

## Add Debian unstable to get R 3.1.1 (release 2014-07-10) which has not 
## yet migrated to testing
## No longer needed as of Sep 2014
# #RUN echo "deb http://http.debian.net/debian unstable main" > /etc/apt/sources.list.d/unstable.list
# #RUN apt-get update -qq

## Now install R and littler, and create a link for littler in /usr/local/bin
RUN apt-get install -y --no-install-recommends r-base r-base-dev r-recommended littler \
&& ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r \
&& ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r \
&& install.r docopt

## Install a few more things that are useful
RUN apt-get install -y --no-install-recommends vim-tiny less wget

## Set a default CRAN Repo
RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /etc/R/Rprofile.site
