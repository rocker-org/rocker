## Emacs, make this -*- mode: sh; -*-

## start with the latest ubuntu
FROM ubuntu:latest

## That's me
MAINTAINER Dirk Eddelbuettel edd@debian.org

## Remain current
RUN apt-get update -qq && apt-get dist-upgrade -y && apt-get install -y software-properties-common

## Add CRAN repo to get current R
RUN add-apt-repository "deb http://cran.rstudio.com/bin/linux/ubuntu $(lsb_release -cs)/" && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

## Update again
RUN apt-get update -qq && apt-get dist-upgrade -y

## Now install R and littler, and create a link for littler in /usr/local/bin
RUN apt-get install -y --no-install-recommends r-base r-base-dev r-recommended littler \
&& ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r \
&& ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r \
&& install.r docopt

## Install a few more things that are useful
RUN apt-get install -y --no-install-recommends vim-tiny less wget



