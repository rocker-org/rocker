# rocker #

[![Build Status](https://travis-ci.org/rocker-org/rocker.svg)](https://travis-ci.org/rocker-org/rocker)

## Overview ##

This repository contains Dockerfiles for different Docker containers of interest to R users. 

## Getting Started ##

To get started right away, ensure you have [Docker installed](https://docs.docker.com/installation/) and start a container with `docker run --rm -ti rocker/r-base` (see [here](https://docs.docker.com/reference/run/) for the `docker run` command options). In this case we are starting the `r-base` container (the base package to build from) in an interactive mode, see below for details of the other containers currently available. To get started on the `rstudio` container or its derivative containers (eg. `hadleyverse` and `ropensci`) you need to open a port, see the [instructions in the wiki](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image). The [wiki](https://github.com/rocker-org/rocker/wiki) also contains further instructions and information on the project, including how to extend these images and contribute to development.

## Status ##

This is work in progress; please read our [instructions to contributors](https://github.com/rocker-org/rocker/wiki/How-to-contribute) and talk to @eddelbuettel and @cboettig about how to get involved.

## Base Docker Containers ##

| Docker Container Source on GitHub             | Docker Hub Build Status and URL
| :---------------------------------------      | :-----------------------------------------
| r-base (base package to build from)           | [good](https://registry.hub.docker.com/u/rocker/r-base/)
| r-devel (base plus R-devel from SVN)          | [good](https://registry.hub.docker.com/u/rocker/r-devel/)
| rstudio (base plus RStudio Server)            | [good](https://registry.hub.docker.com/u/rocker/rstudio/)


## Use cases ##

The rocker project also hosts Docker images illustrating particular use cases. More information
about these can be found in their respective respositories on [rocker-org](https://github.com/rocker-org)

| Docker Container Source on GitHub                         | Docker Hub Build Status and URL
| :---------------------------------------                  | :-----------------------------------------
| hadleyverse (rstudio + Hadley's packages, LaTeX)          | [good](https://registry.hub.docker.com/u/rocker/hadleyverse/)
| ropensci (hadleyverse + rOpenSci packages)                | [good](https://registry.hub.docker.com/u/rocker/ropensci/)
| r-devel-san (base, SVN's R-devel and SAN)                 | [good](https://registry.hub.docker.com/u/rocker/r-devel-san/)

Anyone interested in proposing or collaborating on additional use cases should read our [guide to contributing](https://github.com/rocker-org/rocker/wiki/How-to-contribute) and [get in touch](http://github.com/rocker-org/rocker/issues)

## License ##

The Dockerfiles in this repository are licensed under the GPL 2 or later.

## Trademarks ##

RStudio is a registered trademark of RStudio, Inc.  The use of the trademarked term RStudio and the distribution of the RStudio binaries through the images hosted on [hub.docker.com](https://registry.hub.docker.com/) has been granted by explicit permission of RStudio.  Please review [RStudio's trademark use policy](http://www.rstudio.com/about/trademark/) and address inquiries about further distribution or other questions to [permissions@rstudio.com](emailto:permissions@rstudio.com).


