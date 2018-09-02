[![Build Status](https://travis-ci.org/rocker-org/rocker.svg?branch=master)](https://travis-ci.org/rocker-org/rocker)

# rocker #

## Overview ##

This repository contains Dockerfiles for different Docker containers of interest to R users. 

## Getting Started ##

To get started right away, ensure you have [Docker installed](https://docs.docker.com/installation/) and start a container with `docker run --rm -ti rocker/r-base` (see [here](https://docs.docker.com/engine/reference/run/) for the `docker run` command options). In this case we are starting the `r-base` container (the base package to build from) in an interactive mode, see below for details of the other containers currently available. To get started on the `rstudio` container or its derivative containers (eg. `hadleyverse` and `ropensci`) you need to open a port, see the [instructions in the wiki](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image). The [wiki](https://github.com/rocker-org/rocker/wiki) also contains further instructions and information on the project, including how to extend these images and contribute to development.

## Status ##

This is work in progress; please read our [instructions to contributors](https://github.com/rocker-org/rocker/wiki/How-to-contribute) and talk to @eddelbuettel and @cboettig about how to get involved.

## Base Docker Containers ##


image            | description                               | size   | metrics | build status 
---------------- | ----------------------------------------- | ------ | ------- | --------------
[r-base](https://hub.docker.com/r/_/r-base)            |  Current R via apt-get with `debian:testing` & `unstable` repos  | [![](https://images.microbadger.com/badges/image/library/r-base.svg)](https://microbadger.com/images/library/r-base) | [![](https://img.shields.io/docker/pulls/library/r-base.svg)](https://hub.docker.com/r/library/r-base) |  [![](https://img.shields.io/docker/automated/rocker/r-base.svg)](https://hub.docker.com/r/library/r-base/builds)
[r-devel](https://hub.docker.com/r/rocker/r-devel)        |  R-devel added side-by-side onto r-base (using alias `RD`)       | [![](https://images.microbadger.com/badges/image/rocker/r-devel.svg)](https://microbadger.com/images/rocker/r-devel) | [![](https://img.shields.io/docker/pulls/rocker/r-devel.svg)](https://hub.docker.com/r/rocker/r-devel) |  [![](https://img.shields.io/docker/automated/rocker/r-devel.svg)](https://hub.docker.com/r/rocker/r-devel/builds) 
[drd](https://hub.docker.com/r/rocker/drd)        |  lighter r-devel, built not quite daily       | [![](https://images.microbadger.com/badges/image/rocker/drd.svg)](https://microbadger.com/images/rocker/drd) | [![](https://img.shields.io/docker/pulls/rocker/drd.svg)](https://hub.docker.com/r/rocker/drd) |  [![](https://img.shields.io/docker/automated/rocker/drd.svg)](https://hub.docker.com/r/rocker/drd/builds) 
[r-ver](https://hub.docker.com/r/rocker/r-ver)            |  Specify R version in docker tag. Builds on `debian:stable`  | [![](https://images.microbadger.com/badges/image/rocker/r-ver.svg)](https://microbadger.com/images/rocker/r-ver) | [![](https://img.shields.io/docker/pulls/rocker/r-ver.svg)](https://hub.docker.com/r/rocker/r-ver) |  [![](https://img.shields.io/docker/automated/rocker/r-ver.svg)](https://hub.docker.com/r/rocker/r-ver/builds)


## Use cases

The rocker project also hosts Docker images illustrating particular use cases. More information
about these can be found in their respective respositories on [rocker-org](https://github.com/rocker-org)

### Unversioned images (builds on r-base)

image            | description                               | size   | metrics | build status 
---------------- | ----------------------------------------- | ------ | ------- | --------------
[r-devel-san](https://hub.docker.com/r/rocker/r-devel-san)        |  as r-devel, but built with compiler sanatizers        | [![](https://images.microbadger.com/badges/image/rocker/r-devel-san.svg)](https://microbadger.com/images/rocker/r-devel-san) | [![](https://img.shields.io/docker/pulls/rocker/r-devel-san.svg)](https://hub.docker.com/r/rocker/r-devel-san) |  [![](https://img.shields.io/docker/automated/rocker/r-devel-san.svg)](https://hub.docker.com/r/rocker/r-devel-san/builds) 
[r-devel-ubsan-clang](https://hub.docker.com/r/rocker/r-devel-ubsan-clang)            |  Sanatizers, clang c compiler (instead of gcc)   | [![](https://images.microbadger.com/badges/image/rocker/r-devel-ubsan-clang.svg)](https://microbadger.com/images/rocker/r-devel-ubsan-clang) | [![](https://img.shields.io/docker/pulls/rocker/r-devel-ubsan-clang.svg)](https://hub.docker.com/r/rocker/r-devel-ubsan-clang) | [![](https://img.shields.io/docker/automated/rocker/r-devel-ubsan-clang.svg)](https://hub.docker.com/r/rocker/r-devel-ubsan-clang/builds)
[rstudio:testing](https://hub.docker.com/r/rocker/r-devel-san)        |  rstudio on debian:testing                | [![](https://images.microbadger.com/badges/image/rocker/r-devel-san.svg)](https://microbadger.com/images/rocker/r-devel-san) | [![](https://img.shields.io/docker/pulls/rocker/r-devel-san.svg)](https://hub.docker.com/r/rocker/r-devel-san) |  [![](https://img.shields.io/docker/automated/rocker/r-devel-san.svg)](https://hub.docker.com/r/rocker/r-devel-san/builds) 
[shiny](https://hub.docker.com/r/rocker/shiny)        |  shiny-server on r-base               | [![](https://images.microbadger.com/badges/image/rocker/shiny.svg)](https://microbadger.com/images/rocker/shiny) | [![](https://img.shields.io/docker/pulls/rocker/shiny.svg)](https://hub.docker.com/r/rocker/shiny) |  [![](https://img.shields.io/docker/automated/rocker/shiny.svg)](https://hub.docker.com/r/rocker/shiny/builds) 
[r-apt](https://hub.docker.com/r/rocker/r-apt)        |   (R plus CRAN + marutter repo information)     | [![](https://images.microbadger.com/badges/image/rocker/r-apt.svg)](https://microbadger.com/images/rocker/r-apt) | [![](https://img.shields.io/docker/pulls/rocker/r-apt.svg)](https://hub.docker.com/r/rocker/r-apt) |  [![](https://img.shields.io/docker/automated/rocker/r-apt.svg)](https://hub.docker.com/r/rocker/r-apt/builds) 

### Versioned stack (builds on r-ver)

These images build on `rocker/r-ver`.  Each of these include tags to specify the desired version of R, from `3.1.0`- `3.4.0`, `:latest` and `:devel`.  See [rocker-versioned](https://github.com/rocker-org/rocker-versioned) repo for details.

image            | description                               | size   | metrics | build status 
---------------- | ----------------------------------------- | ------ | ------- | --------------
[rstudio](https://hub.docker.com/r/rocker/rstudio)          |  Adds rstudio                             | [![](https://images.microbadger.com/badges/image/rocker/rstudio-stable.svg)](https://microbadger.com/) | [![](https://img.shields.io/docker/pulls/rocker/rstudio.svg)](https://hub.docker.com/r/rocker/rstudio)  |  [![](https://img.shields.io/docker/automated/rocker/rstudio.svg)](https://hub.docker.com/r/rocker/rstudio/builds)
[tidyverse](https://hub.docker.com/r/rocker/tidyverse)        |  Adds tidyverse & devtools                | [![](https://images.microbadger.com/badges/image/rocker/tidyverse.svg)](https://microbadger.com/images/rocker/tidyverse) | [![](https://img.shields.io/docker/pulls/rocker/tidyverse.svg)](https://hub.docker.com/r/rocker/tidyverse) |  [![](https://img.shields.io/docker/automated/rocker/tidyverse.svg)](https://hub.docker.com/r/rocker/tidyverse/builds) 
[verse](https://hub.docker.com/r/rocker/verse)            |  Adds tex & publishing-related packages   | [![](https://images.microbadger.com/badges/image/rocker/verse.svg)](https://microbadger.com/images/rocker/verse) | [![](https://img.shields.io/docker/pulls/rocker/verse.svg)](https://hub.docker.com/r/rocker/verse) | [![](https://img.shields.io/docker/automated/rocker/verse.svg)](https://hub.docker.com/r/rocker/verse/builds)
[geospatial](https://hub.docker.com/r/rocker/geospatial)            |  Adds geospatial libraries   | [![](https://images.microbadger.com/badges/image/rocker/geospatial.svg)](https://microbadger.com/images/rocker/geospatial) | [![](https://img.shields.io/docker/pulls/rocker/geospatial.svg)](https://hub.docker.com/r/rocker/geospatial) | [![](https://img.shields.io/docker/automated/rocker/geospatial.svg)](https://hub.docker.com/r/rocker/geospatial/builds)

Anyone interested in proposing or collaborating on additional use cases should read our [guide to contributing](https://github.com/rocker-org/rocker/wiki/How-to-contribute) and [get in touch](http://github.com/rocker-org/rocker/issues)

## License ##

The Dockerfiles in this repository are licensed under the GPL 2 or later.

## Trademarks ##

RStudio is a registered trademark of RStudio, Inc.  The use of the trademarked term RStudio and the distribution of the RStudio binaries through the images hosted on [hub.docker.com](https://registry.hub.docker.com/) has been granted by explicit permission of RStudio.  Please review [RStudio's trademark use policy](http://www.rstudio.com/about/trademark/) and address inquiries about further distribution or other questions to [permissions@rstudio.com](emailto:permissions@rstudio.com).


