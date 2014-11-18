## Emacs, make this -*- mode: sh; -*-
 
FROM debian:jessie

## This handle reaches Carl and Dirk
MAINTAINER "Carl Boettiger and Dirk Eddelbuettel" rocker-maintainers@eddelbuettel.com

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
&&  ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r \
&&  ln -s /usr/share/doc/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
&&  ln -s /usr/share/doc/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
&&  install.r docopt \
&&  rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## Set a default CRAN Repo
RUN echo 'options(repos = list(CRAN = "http://cran.rstudio.com/"))' >> /etc/R/Rprofile.site

## Set a default user. Available via runtime flag `--user docker` 
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (for rstudio or linked volumes to work properly). (could use adduser to create this automatically instead)
RUN useradd docker \
&& mkdir /home/docker \
&& chown docker:docker /home/docker \
&& addgroup docker staff


## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
&& locale-gen en_US.utf8 \
&& /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

