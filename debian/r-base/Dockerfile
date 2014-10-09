## Emacs, make this -*- mode: sh; -*-

## start with the Debian testing
FROM debian:testing

## This handle reaches Carl and Dirk
MAINTAINER "Carl Boettiger and Dirk Eddelbuettel" rocker-maintainers@eddelbuettel.com

## Remain current
RUN apt-get update -qq \
&& apt-get dist-upgrade -y

## Now install R and littler, and create a link for littler in /usr/local/bin
RUN apt-get update -qq \
&&  apt-get install -y --no-install-recommends \
    ed \
    less \
    littler \
    locales \
    r-base \
    r-base-dev \
    r-recommended \
    vim-tiny \
    wget \
&&  ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r \
&&  install.r docopt

## Set a default CRAN Repo
RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' >> /etc/R/Rprofile.site

## Set a default user. Available via runtime flag `--user docker` 
RUN useradd docker
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
RUN addgroup docker staff

## Configure default locale
RUN dpkg-reconfigure locales \
    && locale-gen C.UTF-8 \
    && /usr/sbin/update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8


## Install the most recent littler scripts 
WORKDIR /usr/share/doc/littler/examples/
RUN rm install2.r \
&&  wget --no-check-certificate https://github.com/cboettig/littler/raw/master/examples/install2.r \
&&  wget --no-check-certificate https://github.com/eddelbuettel/littler/raw/master/examples/installGithub.r \
&&  wget --no-check-certificate https://github.com/eddelbuettel/littler/raw/master/examples/testInstalled.r \
&&  chmod a+x install2.r installGithub.r testInstalled.r \
&&  ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r \
&&  ln -s /usr/share/doc/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
&&  ln -s /usr/share/doc/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r
WORKDIR /

