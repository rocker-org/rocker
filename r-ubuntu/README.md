
r-ubuntu -- 'r-base' for Ubuntu LTS
===================================

This Dockerfile is close to the ['r-base'](https://github.com/rocker-org/rocker/tree/master/r-base) container
for Rocker -- which is the same container as the official ['r-base'](https://hub.docker.com/_/r-base) container for R -- but based on
Ubuntu LTS.  And while 'r-base' uses Debian testing, this container is based on
the LTS release and connects to the [PPA by Michael Rutter](https://launchpad.net/~marutter/+archive/ubuntu/c2d4u3.5) with over
4,000 r-cran-* packages.

To install, use the explicit LTS tag---currently 18.04---when pulling

```
docker pull r-ubuntu:18.04
```

as we do not want to use latest (which may suggest an interim Ubuntu release
between the bi-annual LTS schedule).

As always, this is work in progress -- please come and talk to @eddelbuettel and
@cboettig (via GitHub issue tickets) about how to get involved.

Documentation is being added at the [Wiki](https://github.com/rocker-org/rocker/wiki).
