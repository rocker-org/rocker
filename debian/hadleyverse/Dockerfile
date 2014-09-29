## Strategy is generally to build packages from CRAN. This results in
## slower image building times, but end user still gets the binary docker
## image anyway.  This results in a more up-to-date base image, though
## also a larger one due to the build-dependencies.


## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM eddelbuettel/debian-rstudio
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add CRAN binaries and update
RUN echo 'deb http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list \
&& gpg --keyserver keyserver.ubuntu.com --recv-keys AE05705B842492A68F75D64E01BF7284B26DD379 \ 
&& gpg --export AE05705B842492A68F75D64E01BF7284B26DD379  | apt-key add -
#RUN gpg --check-sigs AE05705B842492A68F75D64E01BF7284B26DD379 

## apt-get build-dep needs the source repositories as well
RUN echo 'deb-src http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list \
&& echo 'deb-src http://http.debian.net/debian testing main' >> /etc/apt/sources.list 

## Refresh package list and upgrade
RUN apt-get -qq update && apt-get -qqy dist-upgrade


## rmarkdown needs pandoc, and works best with some additional (large!) latex libraries
RUN apt-get install -qqy --no-install-recommends texlive-humanities \
lmodern texlive-fonts-recommended texlive-latex-extra imagemagick \
pandoc pandoc-citeproc 


## Install build dependencies for R packages 
RUN apt-get install -qqy --no-install-recommends build-essential \
&& apt-get build-dep -y r-cran-rgl r-cran-xml r-cran-rjava \
r-cran-rmysql r-cran-rsqlite r-cran-rsqlite.extfuns r-cran-rpostgresql 

## OR Instead of build-deb, we could just use the debian binaries for these packages that have external build dependencies.
## This means having packages that may be less recent than versions on CRAN.
# RUN apt-get install -qy r-cran-rgl r-cran-xml r-cran-rjava r-cran-rmysql r-cran-rsqlite r-cran-rsqlite.extfuns r-cran-rpostgresql 


## Finally ready to install the R packages.  NOTE: failure to install a package doesn't throw an image build error. 
## Install devtools, ggplot2, dplyr, tidyr + full suggests lists 
RUN install2.r devtools ggplot2 dplyr tidyr reshape2 roxygen2 knitr testthat rmarkdown httr 



## Set default mirror for github installs
RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /.Rprofile
## Add a few github repos where the CRAN version isn't sufficiently recent (e.g. has outstanding bugs) 
RUN Rscript -e 'devtools::install_github(c("hadley/reshape"));'


