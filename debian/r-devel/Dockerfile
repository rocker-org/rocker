## Emacs, make this -*- mode: sh; -*-

## start with the Debian docker-debian-r/add-r which has R on top of testing
FROM eddelbuettel/docker-debian-r:add-r

## That's me
MAINTAINER Dirk Eddelbuettel edd@debian.org

## Remain current
RUN apt-get update -qq
RUN apt-get dist-upgrade -y

## From the Build-Depends of the Debian R package, plus subversion
## We do this in different commands as each command leads to a different aufs layer
## Yet group a few 'similar' ones together to not have dozens of RUN invocations
RUN apt-get install -y --no-install-recommends gcc g++ gfortran 
RUN apt-get install -y --no-install-recommends libblas-dev liblapack-dev 
RUN apt-get install -y --no-install-recommends tcl8.5-dev tk8.5-dev 
RUN apt-get install -y --no-install-recommends bison groff-base 
RUN apt-get install -y --no-install-recommends libncurses5-dev libreadline-dev 
RUN apt-get install -y --no-install-recommends debhelper bash-completion 
RUN apt-get install -y --no-install-recommends texinfo 
RUN apt-get install -y --no-install-recommends libbz2-dev liblzma-dev zlib1g-dev 
RUN apt-get install -y --no-install-recommends libpcre3-dev 
RUN apt-get install -y --no-install-recommends xdg-utils 
RUN apt-get install -y --no-install-recommends libpng-dev libjpeg-dev 
RUN apt-get install -y --no-install-recommends libx11-dev libxt-dev x11proto-core-dev 
RUN apt-get install -y --no-install-recommends libpango1.0-dev libcairo2-dev libtiff5-dev 
RUN apt-get install -y --no-install-recommends xvfb xauth xfonts-base 
RUN apt-get install -y --no-install-recommends texlive-base texlive-latex-base 
RUN apt-get install -y --no-install-recommends texlive-generic-recommended 
RUN apt-get install -y --no-install-recommends texlive-fonts-recommended texlive-fonts-extra 
RUN apt-get install -y --no-install-recommends texlive-extra-utils texlive-latex-recommended texlive-latex-extra 
RUN apt-get install -y --no-install-recommends default-jdk 
RUN apt-get install -y --no-install-recommends mpack 
RUN apt-get install -y --no-install-recommends subversion 

## Check out R-devel
RUN cd /tmp && svn co http://svn.r-project.org/R/trunk R-devel 

## Build and install
RUN cd /tmp/R-devel && R_PAPERSIZE=letter R_BATCHSAVE="--no-save --no-restore" R_BROWSER=xdg-open PAGER=/usr/bin/pager PERL=/usr/bin/perl R_UNZIPCMD=/usr/bin/unzip R_ZIPCMD=/usr/bin/zip R_PRINTCMD=/usr/bin/lpr LIBnn=lib AWK=/usr/bin/awk CFLAGS="-pipe -std=gnu99 -Wall -pedantic -O3" CXXFLAGS="-pipe -Wall -pedantic -O3" ./configure --enable-R-shlib --without-blas --without-lapack --without-readline --without-recommended-packages --program-suffix=dev
RUN cd /tmp/R-devel && make && make install

## Set Renviron.site to get libs from base R install
run echo "R_LIBS_SITE=\${R_LIBS_SITE-'/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library'}" > /usr/local/lib/R/etc/Renviron.site
run cd /usr/local/bin && mv R Rdevel && mv Rscript Rscriptdevel

