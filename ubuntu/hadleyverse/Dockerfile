## Provides: 
# - ggplot2, devtools, dplyr, tidyr, reshape2, testthat, plyr, httr, roxygen2
# - knitr, rmarkdown, shiny
# - rcpp
#
# along with all dependencies and SUGGESTed packages, including database tools (MySQL, PostgreSQL)
# Also provides related development and dynamic documentation tools (compilers, pandoc, latex)
# and inherits the rstudio-server and git tools from the base image, rstudio.

FROM cboettig/rstudio 
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add CRAN binaries and update
RUN add-apt-repository -y ppa:marutter/c2d4u && apt-get update -qq && apt-get upgrade -qy 


## From the Build-Depends of the Debian R package: 968 MB!
## Not sure that these should be considered part of the hadleyverse?  
RUN apt-get install -y --no-install-recommends gcc g++ gfortran libblas-dev liblapack-dev tcl8.5-dev tk8.5-dev bison groff-base libncurses5-dev libreadline-dev debhelper texinfo libbz2-dev liblzma-dev libpcre3-dev xdg-utils zlib1g-dev libpng-dev libjpeg-dev libx11-dev libxt-dev x11proto-core-dev libpango1.0-dev libcairo2-dev libtiff5-dev xvfb xauth xfonts-base texlive-base texlive-latex-base texlive-generic-recommended texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils texlive-latex-recommended texlive-latex-extra default-jdk mpack bash-completion 

## rmarkdown-related dependencies: 146 MB
RUN apt-get install -y --no-install-recommends pandoc pandoc-citeproc texlive-humanities lmodern texlive-fonts-recommended texlive-latex-extra imagemagick librsvg2-bin ghostscript

## R binaries: 149 MB 
RUN apt-get install -y r-cran-dplyr r-cran-devtools r-cran-rcpp r-cran-xml r-cran-rjava r-cran-rmysql r-cran-rsqlite libxslt1-dev r-cran-rsqlite.extfuns r-cran-rmysql r-cran-data.table r-cran-testthat r-cran-knitr r-cran-ggplot2 r-cran-mgcv r-cran-mass r-cran-tidyr r-cran-shiny r-cran-monetdb.r libxslt1-dev libpq-dev 

## Not avaiable on marutter/c2d4u
# r-cran-rstudioapi r-cran-microbenchmark r-cran-rpostgresql r-cran-roxygen2

## R package installs from source 
## (packages for which approriate binaries are not available)
RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /.Rprofile
RUN Rscript -e 'install.packages(c("RPostgreSQL", "roxygen2", "microbenchmark", "rstudioapi"))'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE); biocLite("BiocInstaller")'
RUN Rscript -e 'devtools::install_github(c("rstudio/rmarkdown", "rstudio/packrat", "hadley/bigrquery", "hadley/reshape"))'

## No CMD is needed: imported from cboettig/rstudio. 
## This Configures a persistent daemon running RStudio-server on (container) port 8787
## Otherwise, run interactively with /bin/batch where command is ignored.  


