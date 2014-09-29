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


## We use the littler install2.r script. It currently installs the suggests list too.  Needs docopt package installed: 
RUN ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r \
&& install.r docopt



## Finally ready to install the R packages.  NOTE: failure to install a package doesn't throw an image build error. 
## Install devtools, ggplot2, dplyr, tidyr + full suggests lists 
RUN install2.r devtools ggplot2 dplyr tidyr reshape2 roxygen2 knitr testthat rmarkdown httr 



## Set default mirror for github installs
RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /.Rprofile
## Add a few github repos where the CRAN version isn't sufficiently recent 
RUN Rscript -e 'devtools::install_github(c("hadley/reshape", "yihui/knitr"));'




### NOTES: 

## additional packages available as binaries 
# r-cran-rcpp r-cran-xml r-cran-rjava r-cran-rmysql r-cran-rsqlite r-cran-rsqlite.extfuns r-cran-rpostgresql r-cran-data.table r-cran-microbenchmark r-cran-mgcv r-cran-mass r-cran-rstudioapi r-cran-quantreg r-cran-hmisc r-cran-mapproj r-cran-maps r-cran-hexbin r-cran-maptools r-cran-multcomp r-cran-nlme 
## Not available as binaries from debian.net: 
# r-cran-dplyr r-cran-mg r-cran-tidyr r-cran-monetdb.r


## From the Build-Depends of the Debian R package
#RUN apt-get install -y --no-install-recommends gcc g++ gfortran libblas-dev liblapack-dev tcl8.5-dev tk8.5-dev bison groff-base libncurses5-dev libreadline-dev debhelper texinfo libbz2-dev liblzma-dev libpcre3-dev xdg-utils zlib1g-dev libpng-dev libjpeg-dev libx11-dev libxt-dev x11proto-core-dev libpango1.0-dev libcairo2-dev libtiff5-dev xvfb xauth xfonts-base texlive-base texlive-latex-base texlive-generic-recommended texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils texlive-latex-recommended texlive-latex-extra default-jdk mpack bash-completion subversion gcc-4.9 g++-4.9 gfortran-4.9


# RUN install.r shiny MonetDB.R packrat




