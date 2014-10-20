# rocker #

## Overview ##

Dockerfiles for different Docker containers of interest to R users.

## Status ##

This is work in progress; talk to @eddelbuettel and @cboettig about how to get involved.

## Base Docker Containers ##

| Docker Container Source on GitHub             | Docker Hub Build Status and URL
| :---------------------------------------      | :-----------------------------------------
| r-base (base package to build from)           | [good](https://registry.hub.docker.com/u/rocker/r-base/)
| r-devel (base plus R-devel from SVN)          | [good](https://registry.hub.docker.com/u/rocker/r-devel/)
| rstudio (base plus RStudio Server)            | [good](https://registry.hub.docker.com/u/rocker/rstudio/)
| r-devel-san (base, SVN's R-devel and SAN)     | [good](https://registry.hub.docker.com/u/rocker/r-devel-san/)


## Use cases ##

The rocker project also hosts Docker images illustrating particular use cases. More information
about these can be found in their respective respositories on [rocker-org](https://github.com/rocker-org)

| Docker Container Source on GitHub             | Docker Hub Build Status and URL
| :---------------------------------------      | :-----------------------------------------
| hadleyverse (rstudio plus Hadley packages)    | [good](https://registry.hub.docker.com/u/rocker/hadleyverse/)
| ropensci (hadleyverse + rOpenSci packages)    | [good](https://registry.hub.docker.com/u/rocker/ropensci/)

Anyone interested in proposing or collaborating on additional use cases should [get in touch](http://github.com/rocker-org/rocker/issues)


## Getting Started ##

See the **[rocker-org Wiki](https://github.com/rocker-org/rocker/wiki)** for more information on the project, including how to use or extend these images, contribute to development, and more!

## License ##

The Dockerfiles in this repository are licensed under the GPL 2 or later.

## Trademarks ##

RStudio is a registered trademark of RStudio, Inc.  The use
of the trademarked term RStudio and the distribution
of the RStudio binaries through the images hosted on
[hub.docker.com](https://registry.hub.docker.com/) has been granted
by explicit permission of RStudio.  Please review [RStudio's
trademark use policy](http://www.rstudio.com/about/trademark/) and
address inqueries about further distribution or other questions to
[permissions@rstudio.com](emailto:permissions@rstudio.com).


