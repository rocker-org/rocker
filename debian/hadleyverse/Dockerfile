## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM eddelbuettel/debian-rstudio
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add CRAN binaries and update
RUN echo 'deb http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list \
&& gpg --keyserver keyserver.ubuntu.com --recv-keys AE05705B842492A68F75D64E01BF7284B26DD379 \ 
&& gpg --export AE05705B842492A68F75D64E01BF7284B26DD379  | apt-key add -
#RUN gpg --check-sigs AE05705B842492A68F75D64E01BF7284B26DD379 

## We need the deb-src repositories to use apt-get build-dep
RUN echo 'deb-src http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list \
&& echo 'deb-src http://http.debian.net/debian testing main' >> /etc/apt/sources.list 

## Refresh package list and upgrade
RUN apt-get -qq update && apt-get -qqy dist-upgrade

## rmarkdown needs pandoc, and works best with some additional (large!) latex libraries
RUN apt-get install -qqy --no-install-recommends texlive-humanities \
lmodern texlive-fonts-recommended texlive-latex-extra imagemagick \
pandoc pandoc-citeproc 

## Install build dependencies for R packages with apt-get build-dep 
RUN apt-get install -qqy --no-install-recommends build-essential \
&& apt-get build-dep -y r-cran-rgl r-cran-xml r-cran-rjava \
r-cran-rmysql r-cran-rsqlite r-cran-rsqlite.extfuns r-cran-rpostgresql 

## Finally ready to install the R packages.  NOTE: failure to install a package doesn't throw an image build error. 
## Install devtools, ggplot2, dplyr, tidyr + full suggests lists 
RUN install2.r devtools ggplot2 dplyr tidyr reshape2 roxygen2 knitr testthat rmarkdown httr 

## Add a few github repos where the CRAN version isn't sufficiently recent (e.g. has outstanding bugs) 
RUN Rscript -e 'devtools::install_github(c("hadley/reshape"));'


