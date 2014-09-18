
## Docker Images for R on Ubuntu

These directories offer several configurations for R on Ubuntu:

* `add-r`: Starts from `ubuntu:latest` and adds just the R binary via the
r-base package, as well as littler.  This images carries the default tag `latest`.

* `add-r-devel`: Starts from `add-r` and adds all Build-Depends: for the R
package as well as subversion; it checks out the current SVN sources of
R-devel, and then builds R-devel which is installed as
`/usr/local/bin/Rdevel` to distinguish from `R` which invokes the released version of R.
This image is installed with tag `add-r-devel`.

* `add-r-devel-san`: Also starts from `add-r`, adds everything that
`add-r-devel` add but then also adds gcc-4.8, g++-4.8 and gfortran-4.8 before
checking out the current SVN sources of R-devel.  This image then builds
R-devel from these source using gcc/g++ 4.8 with the Address Sanitizer
configuration [described in Section 4.3.3 of the Writing R Extension
manual](http://cran.rstudio.com/doc/manuals/r-devel/R-exts.html#Using-Address-Sanitizer).
The binary is also installed as `/usr/local/bin/Rdevel` to distinguish it from `R`
which invokes the released version of R.
This image is installed with tag `add-r-devel-san`.

## GitHub repo

See [the GitHub repo](https://github.com/eddelbuettel/docker-ubuntu-r) for
sources etc.

There is a matching [GitHub repo for Debian](https://github.com/eddelbuettel/docker-debian-r).

### Docker Hub

The GitHub  repository is linked to 
[this automated build facility at Docker](https://registry.hub.docker.com/u/eddelbuettel/docker-ubuntu-r/)
and one can retrieve the corresponding images via a standard `docker pull`.

### Author

Dirk Eddelbuettel

### License

GPL (>= 2)



