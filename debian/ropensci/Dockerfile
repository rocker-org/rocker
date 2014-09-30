## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM eddelbuettel/debian-hadleyverse
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Refresh package list and upgrade
RUN apt-get -qq update && apt-get -qqy dist-upgrade
## Install build dependencies
RUN apt-get install -qqy --no-install-recommends libxslt1-dev 

## Install Omegahat dependencies 
RUN echo 'options("repos"="http://cran.rstudio.com", encoding="UTF-8")' > .Rprofile
RUN r -e 'install.packages(c("SSOAP", "XMLSchema", "Sxslt", "RWordXML", "RHTMLForms"), repo="http://www.omegahat.org/R", type="source")'

## Install Github dependencies
RUN Rscript -e 'devtools::install_github("DataONEorg/rdataone", subdir="dataonelibs"); devtools::install_github("ropensci/rdataone", subdir="dataone", dependencies=NA)'
RUN Rscript -e 'devtools::install_github("egonw/rrdf", subdir="rrdflibs", build_vignettes=FALSE); devtools::install_github("egonw/rrdf", subdir="rrdf", build_vignettes=FALSE)'

## Install build dependencies
RUN apt-get install -qy libgeos-dev libgeos-c1 gdal-bin libgdal1h libgdal1-dev netcdf-bin libproj-dev

# r-cran-rgeos not available on debian..
#&& apt-get build-dep r-cran-rgdal not working. (nor for r-cran-rgeos. r-cran-rgdal not actually installable for debian). Oh well, install manually instead.  

## Install the rOpenSci R packages that are currently on CRAN
RUN install2.r spocc AntWeb ecoengine rebird rAvis rfisheries treebase rfishbase rbhl rgbif taxize rsnps rentrez paleobioDB rnoaa rdryad RSelenium rinat rbison bold rplos aRxiv rAltmetric alm rfigshare dvn RNeXML solr Reol rWBclimate

## Install rhdf5 
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE); biocLite("BiocInstaller")'


