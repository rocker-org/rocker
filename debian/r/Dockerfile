FROM cboettig/rstudio:debian 
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Add CRAN binaries and update

## Questions for Dirk: 
## Is it unwise to be pulling from this repository on a ubuntu-based image?  
## Can we automate this check-sigs part or is that a controdiction in terms?
RUN echo 'deb http://debian-r.debian.net/debian-r/ unstable main' >> /etc/apt/sources.list && gpg --keyserver keyserver.ubuntu.com --recv-keys AE05705B842492A68F75D64E01BF7284B26DD379 && gpg --export AE05705B842492A68F75D64E01BF7284B26DD379  | apt-key add -
#RUN gpg --check-sigs AE05705B842492A68F75D64E01BF7284B26DD379 

## Refresh package list and upgrade
RUN apt-get -qq update && apt-get -qqy dist-upgrade

## Install devtools, ggplot2, dplyr, tidyr + full suggests lists 
RUN apt-get -y install r-cran-devtools r-cran-roxygen2 r-cran-rcpp r-cran-xml r-cran-rjava r-cran-rmysql r-cran-rsqlite libxslt1-dev r-cran-rsqlite.extfuns r-cran-rmysql r-cran-rpostgresql r-cran-data.table r-cran-testthat r-cran-knitr r-cran-microbenchmark r-cran-ggplot2 r-cran-mgcv r-cran-mass r-cran-knitr r-cran-rstudioapi r-cran-ggplot2 r-cran-shiny r-cran-quantreg r-cran-hmisc r-cran-mapproj r-cran-maps r-cran-hexbin r-cran-maptools r-cran-multcomp r-cran-nlme 

## Not available: 
# r-cran-dplyr r-cran-mg r-cran-tidyr r-cran-monetdb.r

## From the Build-Depends of the Debian R package
RUN apt-get install -y --no-install-recommends gcc g++ gfortran libblas-dev liblapack-dev tcl8.5-dev tk8.5-dev bison groff-base libncurses5-dev libreadline-dev debhelper texinfo libbz2-dev liblzma-dev libpcre3-dev xdg-utils zlib1g-dev libpng-dev libjpeg-dev libx11-dev libxt-dev x11proto-core-dev libpango1.0-dev libcairo2-dev libtiff5-dev xvfb xauth xfonts-base texlive-base texlive-latex-base texlive-generic-recommended texlive-fonts-recommended texlive-fonts-extra texlive-extra-utils texlive-latex-recommended texlive-latex-extra default-jdk mpack bash-completion subversion gcc-4.9 g++-4.9 gfortran-4.9

## Additional libraries for rmarkdown stuff
RUN apt-get install -qqy --no-install-recommends texlive-humanities lmodern texlive-fonts-recommended texlive-latex-extra imagemagick pandoc pandoc-citeproc 

RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > /.Rprofile
RUN Rscript -e 'install.packages(c("shiny", "dplyr", "tidyr", "mg", "MonetDB.R"))'
RUN Rscript -e 'install.packages(c("SSOAP", "XMLSchema", "Sxslt"), repo="http://www.omegahat.org/R", type="source")'
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE)' 
RUN Rscript -e 'devtools::install_github("egonw/rrdf", subdir="rrdflibs", build_vignettes=FALSE); devtools::install_github("egonw/rrdf", subdir="rrdf", build_vignettes=FALSE)'
RUN Rscript -e 'devtools::install_github(c("rstudio/rmarkdown", "rstudio/packrat", "hadley/reshape"));'

## Shiny
RUN wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.2.1.362-amd64.deb && sudo gdebi --non-interactive shiny-server-*.deb
EXPOSE 3838

## No CMD is needed: imported from cboettig/rstudio. 
## This Configures a persistent daemon running RStudio-server on (container) port 8787
## Otherwise, run interactively with /bin/batch where command is ignored.  


## Install development/unstable branch of R as Rdevel for testing purposes:
## Check out R-devel
RUN cd /tmp && svn co http://svn.r-project.org/R/trunk R-devel 
RUN cd /tmp/R-devel && R_PAPERSIZE=letter R_BATCHSAVE="--no-save --no-restore" R_BROWSER=xdg-open PAGER=/usr/bin/pager PERL=/usr/bin/perl R_UNZIPCMD=/usr/bin/unzip R_ZIPCMD=/usr/bin/zip R_PRINTCMD=/usr/bin/lpr LIBnn=lib AWK=/usr/bin/awk CFLAGS="-pipe -std=gnu99 -Wall -pedantic -O2 -fno-omit-frame-pointer -g" CXXFLAGS="-pipe -Wall -pedantic -O3" CC="gcc-4.9 -fsanitize=address" CXX="g++-4.9 -fsanitize=address" FC="gfortran-4.9 -fsanitize=address" F77="gfortran-4.9 -fsanitize=address" ./configure --enable-R-shlib --without-blas --without-lapack --without-readline --without-recommended-packages --program-suffix=dev
RUN cd /tmp/R-devel && make && make install
## Set Renviron.site to get libs from base R install
run echo "R_LIBS_SITE=\${R_LIBS_SITE-'/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library'}" > /usr/local/lib/R/etc/Renviron.site
run cd /usr/local/bin && mv R Rdevel && mv Rscript Rscriptdevel

