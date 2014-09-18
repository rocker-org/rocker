FROM cboettig/rstudio 
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add CRAN binaries and update
RUN add-apt-repository -y ppa:marutter/c2d4u && apt-get update -qq && apt-get upgrade -qy 


## From the Build-Depends of the Debian R package: 968 MB!
RUN apt-get install -y --no-install-recommends gcc g++ gfortran libblas-dev liblapack-dev tcl8.5-dev tk8.5-dev bison groff-base libncurses5-dev libreadline-dev debhelper texinfo libbz2-dev liblzma-dev libpcre3-dev xdg-utils zlib1g-dev libpng-dev libjpeg-dev libx11-dev libxt-dev x11proto-core-dev libpango1.0-dev libcairo2-dev libtiff5-dev xvfb xauth xfonts-base texlive-base texlive-latex-base texlive-generic-recommended texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils texlive-latex-recommended texlive-latex-extra default-jdk mpack bash-completion 

## rmarkdown-related dependencies: 146 MB
RUN apt-get install -y --no-install-recommends texlive-humanities lmodern texlive-fonts-recommended texlive-latex-extra imagemagick pandoc pandoc-citeproc 

## R binaries: 149 MB 
RUN apt-get install -y r-cran-dplyr r-cran-devtools r-cran-rcpp r-cran-xml r-cran-rjava r-cran-rmysql r-cran-rsqlite libxslt1-dev r-cran-rsqlite.extfuns r-cran-rmysql r-cran-data.table r-cran-testthat r-cran-knitr r-cran-ggplot2 r-cran-mgcv r-cran-mass r-cran-tidyr r-cran-shiny r-cran-monetdb.r libxslt1-dev libpq-dev 

## Not avaiable on marutter/c2d4u
# r-cran-rstudioapi r-cran-microbenchmark r-cran-rpostgresql r-cran-roxygen2

RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /.Rprofile
RUN Rscript -e 'install.packages(c("RPostgreSQL", "roxygen2", "microbenchmark", "rstudioapi"))'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE); biocLite("BiocInstaller")'
RUN Rscript -e 'devtools::install_github(c("rstudio/rmarkdown", "rstudio/packrat", "hadley/bigrquery", "hadley/reshape"))'
RUN Rscript -e 'install.packages(c("SSOAP", "XMLSchema", "Sxslt"), repo="http://www.omegahat.org/R", type="source")'
RUN Rscript -e 'devtools::install_github("egonw/rrdf", subdir="rrdflibs", build_vignettes=FALSE); devtools::install_github("egonw/rrdf", subdir="rrdf", build_vignettes=FALSE)'

## No CMD is needed: imported from cboettig/rstudio. 
## This Configures a persistent daemon running RStudio-server on (container) port 8787
## Otherwise, run interactively with /bin/batch where command is ignored.  


