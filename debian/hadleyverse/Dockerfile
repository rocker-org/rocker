## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM eddelbuettel/debian-rstudio

## This handle reaches Carl and Dirk
MAINTAINER "Carl Boettiger and Dirk Eddelbuettel" rocker-maintainers@eddelbuettel.com

## Add CRAN binaries and update
RUN echo 'deb http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list \
&& gpg --keyserver keyserver.ubuntu.com --recv-keys AE05705B842492A68F75D64E01BF7284B26DD379 \ 
&& gpg --export AE05705B842492A68F75D64E01BF7284B26DD379  | apt-key add -
#RUN gpg --check-sigs AE05705B842492A68F75D64E01BF7284B26DD379 

## We need the deb-src repositories to use apt-get build-dep
RUN echo 'deb-src http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list \
&& echo 'deb-src http://http.debian.net/debian testing main' >> /etc/apt/sources.list 


## rmarkdown needs pandoc, and works best with some additional (large!) latex libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ghostscript \
    imagemagick \
    lmodern \
    pandoc \
    pandoc-citeproc \ 
    texlive-fonts-recommended \
    texlive-humanities \
    texlive-latex-extra 

## Install build dependencies for R packages with apt-get build-dep 
RUN apt-get update && apt-get build-dep -y \
    r-cran-rgl \
    r-cran-rjava \
    r-cran-rmysql \
    r-cran-rpostgresql \ 
    r-cran-rsqlite \
    r-cran-rsqlite.extfuns \
    r-cran-xml 

RUN install2.r -r http://bioconductor.org/packages/2.13/bioc \
    BiocInstaller \
    && rm -rf /tmp/downloaded_packages/


## Finally ready to install the R packages.  NOTE: failure to install a package doesn't throw an image build error. 
## Install devtools, ggplot2, dplyr, tidyr + full suggests lists
RUN install2.r --error --deps TRUE \
    devtools \
    dplyr \
    ggplot2 \
    httr \ 
    knitr \
    Rcpp \
    reshape2 \
    rmarkdown \
    roxygen2 \
    testthat \
    tidyr && \
    rm -rf /tmp/downloaded_packages/

## Add a few github repos where the CRAN version isn't sufficiently recent (e.g. has outstanding bugs) 
RUN installGithub.r hadley/reshape


