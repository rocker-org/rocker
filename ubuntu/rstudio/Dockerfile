## Start with Dirk Eddelbuettel's R image, based on minimal ubuntu:latest and the current R release.
FROM eddelbuettel/ubuntu-r-base
MAINTAINER Carl Boettiger cboettig@ropensci.org

## discourage apt from prompting the user for input
ENV DEBIAN-FRONTEND noninteractive

## Download and install RStudio server
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe" >> /etc/apt/sources.list \
&& apt-get update -q && apt-get dist-upgrade -yq \
&& apt-get install -y -q gdebi-core libapparmor1 supervisor sudo libcurl4-openssl-dev wget git \
&& update-locale \
&& wget http://download2.rstudio.org/rstudio-server-0.98.994-amd64.deb \
&& gdebi -n rstudio-server-0.98.994-amd64.deb && rm rstudio-server-*-amd64.deb

## This shell script is executed by supervisord when it is run by CMD, configures env variables
ADD userconf.sh /usr/bin/userconf.sh

## Configure persistent daemon serving RStudio-server on (container) port 8787
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 8787

## To have a container run multiple & persistent tasks, we use the very simple supervisord as recommended in Docker documentation.
CMD ["/usr/bin/supervisord"] 



