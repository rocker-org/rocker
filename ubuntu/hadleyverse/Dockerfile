## Provides: 
# - ggplot2, devtools, dplyr, tidyr, reshape2, testthat, plyr, httr, roxygen2
# - knitr, rmarkdown, shiny
# - rcpp
#
# along with all dependencies and SUGGESTed packages, including database tools (MySQL, PostgreSQL)
# Also provides related development and dynamic documentation tools (compilers, pandoc, latex)
# and inherits the rstudio-server and git tools from the base image, rstudio.

FROM eddelbuettel/ubuntu-rstudio 
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add CRAN binaries and update
RUN add-apt-repository -s -y ppa:marutter/c2d4u \
&& apt-get update -qq \
&& apt-get upgrade -qy 

## rmarkdown-related dependencies
RUN apt-get install -y --no-install-recommends pandoc pandoc-citeproc \
texlive-humanities lmodern texlive-fonts-recommended texlive-latex-extra \
imagemagick librsvg2-bin ghostscript build-essential libpq-dev

## Package build dependencies
RUN apt-get build-dep -y r-cran-rgl r-cran-xml r-cran-rjava \
r-cran-rmysql r-cran-rsqlite 


## Install Hadleyverse packages
RUN install2.r devtools ggplot2 dplyr tidyr reshape2 roxygen2 knitr testthat rmarkdown httr rcpp rpostgresql

## Use GitHub version for these
RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /.Rprofile
RUN Rscript -e 'devtools::install_github(c("hadley/reshape"));'


## Run tests 
RUN mkdir tests \
&& Rscript  --default-packages="stats, graphics, grDevices, datasets, utils, methods, base" -e 'fail <- sapply(c("devtools", "ggplot2", "dplyr", "tidyr", "reshape2", "roxygen2", "knitr", "testthat", "rmarkdown", "httr", "Rcpp", "RPostgreSQL"), tools::testInstalledPackage, type=c("tests", "examples"), outDir="tests"); print(fail)'\
&& rm -r tests
