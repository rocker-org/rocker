## Rocker r-rspm

The `r-rspm` Dockerfiles from the [Rocker Project](https://www.rocker-project.org/) provides basic building using Ubuntu (as opposed to Debian in `r-base`) upon which other containers can be built.  They also offer (initial, still somewhat experimental) support for the [RSPM (RStudio Package Manager)](https://rstudio.com/products/package-manager/) binaries for the supported `bionic` (aka 18.04) and `focal` (aka 20.04) releases.  

As an alternative consider the the [`r-ubuntu` containers](https://hub.docker.com/repository/docker/rocker/r-ubuntu) which are also useful due to the large number of packages offered via the PPAs, and their more complete package dependency tracking.  However, RSPM offers more binaries.

Documentation is being added at the [Wiki](https://github.com/rocker-org/rocker/wiki). Please file
issue tickets at [the rocker/ issue tracker](https://github.com/rocker-org/rocker/issues). 
