
## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM eddelbuettel/debian-rstudio

MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add CRAN binaries and update
RUN echo 'deb http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list && gpg --keyserver keyserver.ubuntu.com --recv-keys AE05705B842492A68F75D64E01BF7284B26DD379 && gpg --export AE05705B842492A68F75D64E01BF7284B26DD379  | apt-key add -
#RUN gpg --check-sigs AE05705B842492A68F75D64E01BF7284B26DD379 

## Refresh package list and upgrade
RUN apt-get -qq update && apt-get -qqy dist-upgrade

## Install devtools, ggplot2, dplyr, tidyr + full suggests lists 
RUN apt-get -y install r-cran-devtools r-cran-roxygen2 r-cran-rcpp r-cran-xml r-cran-rjava r-cran-rmysql r-cran-rsqlite libxslt1-dev r-cran-rsqlite.extfuns r-cran-rmysql r-cran-rpostgresql r-cran-data.table r-cran-testthat r-cran-knitr r-cran-microbenchmark r-cran-ggplot2 r-cran-mgcv r-cran-mass r-cran-knitr r-cran-rstudioapi r-cran-ggplot2 r-cran-shiny r-cran-quantreg r-cran-hmisc r-cran-mapproj r-cran-maps r-cran-hexbin r-cran-maptools r-cran-multcomp r-cran-nlme 

## Not available as binaries from debian.net: 
# r-cran-dplyr r-cran-mg r-cran-tidyr r-cran-monetdb.r

## From the Build-Depends of the Debian R package
RUN apt-get install -y --no-install-recommends gcc g++ gfortran libblas-dev liblapack-dev tcl8.5-dev tk8.5-dev bison groff-base libncurses5-dev libreadline-dev debhelper texinfo libbz2-dev liblzma-dev libpcre3-dev xdg-utils zlib1g-dev libpng-dev libjpeg-dev libx11-dev libxt-dev x11proto-core-dev libpango1.0-dev libcairo2-dev libtiff5-dev xvfb xauth xfonts-base texlive-base texlive-latex-base texlive-generic-recommended texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils texlive-latex-recommended texlive-latex-extra default-jdk mpack bash-completion subversion gcc-4.9 g++-4.9 gfortran-4.9

## Additional libraries for rmarkdown stuff
RUN apt-get install -qqy --no-install-recommends texlive-humanities lmodern texlive-fonts-recommended texlive-latex-extra imagemagick pandoc pandoc-citeproc 

## Use the install.r script from littler (which defaults to using cran.rstudio.com)
RUN install.r shiny dplyr tidyr MonetDB.R rmarkdown packrat reshape

## Set default mirror
#RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /.Rprofile

## Add a few github repos -- now done above as CRAN installs
#RUN Rscript -e 'devtools::install_github(c("rstudio/rmarkdown", "rstudio/packrat", "hadley/reshape"));'

## Get hdf5 from BioC
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE)' 



