## Emacs, make this -*- mode: sh; -*-

FROM ubuntu:21.04

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/rocker-org/r-gcc-dev" \
      org.label-schema.vendor="Rocker Project" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

## Set a default user. Available via runtime flag `--user docker` 
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (for rstudio or linked volumes to work properly). 
RUN useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		software-properties-common \
                dirmngr \
                gpg \
                gpg-agent \
                locales

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

## This was not needed before but we need it now
ENV DEBIAN_FRONTEND noninteractive

## Otherwise timedatectl will get called which leads to 'no systemd' inside Docker
ENV TZ UTC

## Add the PPA for gcc development builds
## Install gcc-11 (and g++, gfortran) plus Rcpp and r-base-dev
RUN add-apt-repository ppa:ubuntu-toolchain-r/volatile \
        && apt-get update \
        && apt-get install -y --no-install-recommends \
           gcc-11 \
           g++-11 \
           gfortran-11 \
           r-base-dev \
           r-cran-rcpp \
        && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 60 \
                               --slave /usr/bin/g++ g++ /usr/bin/g++-11 \
                               --slave /usr/bin/gfortran gfortran /usr/bin/gfortran-11 \
 	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
 	&& rm -rf /var/lib/apt/lists/*
