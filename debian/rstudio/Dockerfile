## Start with the rocker image providing 'base R' using a small Debian testing installation and the current R release
FROM r-base:latest

## This handle reaches Carl and Dirk
MAINTAINER "Carl Boettiger and Dirk Eddelbuettel" rocker-maintainers@eddelbuettel.com

ENV DEBIAN-FRONTEND noninteractive  
ENV PATH /usr/lib/rstudio-server/bin/:$PATH   

## Download and install RStudio server
## Attempts to get detect latest version, otherwise falls back to version given in $VER
## Symlink pandoc, pandoc-citeproc so they are available system-wide
RUN apt-get update && apt-get install -y --no-install-recommends \
    file \
    git \
    libcurl4-openssl-dev \
    psmisc \
    supervisor \
    sudo \
&& wget -q http://ftp.us.debian.org/debian/pool/main/o/openssl/libssl0.9.8_0.9.8o-4squeeze14_amd64.deb \ 
&& dpkg -i libssl0.9.8_0.9.8o-4squeeze14_amd64.deb && rm libssl0.9.8_0.9.8o-4squeeze14_amd64.deb \
&& VER=$(wget --no-check-certificate -qO- https://s3.amazonaws.com/rstudio-server/current.ver) \
&& wget -q http://download2.rstudio.org/rstudio-server-${VER}-amd64.deb \
&& dpkg -i rstudio-server-${VER}-amd64.deb \
&& rm rstudio-server-*-amd64.deb \
&& ln -s /usr/lib/rstudio-server/bin/pandoc/pandoc /usr/local/bin \
&& ln -s /usr/lib/rstudio-server/bin/pandoc/pandoc-citeproc /usr/local/bin

## This shell script is executed by supervisord when it is run by CMD, configures env variables
COPY userconf.sh /usr/bin/userconf.sh

## Configure persistent daemon serving RStudio-server on (container) port 8787
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8787

## To have a container run a persistent task, we use the very simple supervisord as recommended in Docker documentation.
CMD ["/usr/bin/supervisord"] 


