## Provides: 
# - ggplot2, devtools, dplyr, tidyr, reshape2, testthat, plyr, httr, roxygen2
# - knitr, rmarkdown, shiny
# - rcpp
#
# along with all dependencies and SUGGESTed packages, including database tools (MySQL, PostgreSQL)
# Also provides related development and dynamic documentation tools (compilers, pandoc, latex)
# and inherits the rstudio-server and git tools from the base image, rstudio.

## This handle reaches Carl and Dirk
MAINTAINER "Carl Boettiger and Dirk Eddelbuettel" rocker-maintainers@eddelbuettel.com

## Add CRAN binaries and update
RUN add-apt-repository -s -y ppa:marutter/c2d4u 

## rmarkdown-related dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ghostscript \
    imagemagick \
    libpq-dev \
    librsvg2-bin \
    lmodern \ 
    pandoc \
    pandoc-citeproc \
    texlive-fonts-recommended \
    texlive-humanities \ 
    texlive-latex-extra 

## Package build dependencies
RUN apt-get update && apt-get build-dep -y \
    r-cran-rgl \
    r-cran-rjava \
    r-cran-rmysql \
    r-cran-rsqlite \
    r-cran-xml


## Install Hadleyverse packages
RUN install2.r \
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

RUN Rscript -e 'devtools::install_github(c("hadley/reshape"));'


## Run tests 
#RUN mkdir tests \
#&& Rscript  --default-packages="stats, graphics, grDevices, datasets, utils, methods, base" -e 'fail <- sapply(c("devtools", "ggplot2", "dplyr", "tidyr", "reshape2", "roxygen2", "knitr", "testthat", "rmarkdown", "httr", "Rcpp"), tools:#:testInstalledPackage, type=c("tests", "examples"), outDir="tests"); print(fail)'\
#&& rm -r tests
