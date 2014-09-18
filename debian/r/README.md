
## Docker Images for R on Debian

These directories offer several configurations for R on Debian. Each
subdirectory corresponds to one distinct build, and each is available under
the same tag as its directory name:

* `add-r`: Starts from `debian:testing` and adds just the R binary via the
r-base package, as well as littler.  This images used to carry the default
tag `latest`. For consistency this was renamed to tag `add-r`.

* `add-r-devel`: Starts from `latest` and adds all Build-Depends: for the R
package as well as subversion; it checks out the current SVN sources of
R-devel, and then builds R-devel which is installed as
`/usr/local/bin/Rdevel` to distinguish from `R` which invokes the released version of R.
This image is installed with tag `add-r-devel`.

* `add-r-devel-san`: Also starts from `latest`, adds everything that
`add-r-devel` add but then also adds gcc-4.9, g++-4.9 and gfortran-4.9 before
checking out the current SVN sources of R-devel.  This image then builds
R-devel from these source using gcc/g++ 4.9 with the Address Sanitizer
configuration [described in Section 4.3.3 of the Writing R Extension
manual](http://cran.rstudio.com/doc/manuals/r-devel/R-exts.html#Using-Address-Sanitizer).
The binary is also installed as `/usr/local/bin/Rdevel` to distinguish from `R`
which invokes the released version of R.
This image is installed with tag `add-r-devel-san`.

* `add-r-devel-ubsan`: Also starts from `latest`, adds everything that
`add-r-devel` add but then also adds gcc-4.9, g++-4.9 and gfortran-4.9 before
checking out the current SVN sources of R-devel.  This image then builds
R-devel from these source using gcc/g++ 4.9 with the Undefined Behaviour Sanitizer
configuration [described in Section 4.3.4 of the Writing R Extension
manual](http://cran.rstudio.com/doc/manuals/r-devel/R-exts.html#Using-Undefined-Behaviour-Sanitizer).
We had to disable OpenMP for this build.
The binary is also installed as `/usr/local/bin/Rdevel` to distinguish from `R`
which invokes the released version of R.
This image is installed with tag `add-r-devel-ubsan`.

## GitHub repo

See [the GitHub repo](https://github.com/eddelbuettel/docker-debian-r) for
sources etc.

### Docker Hub

The GitHub  repository is linked to 
[this automated build facility at Docker](https://registry.hub.docker.com/u/eddelbuettel/docker-debian-r/)
and one can retrieve the corresponding images via a standard `docker pull`.

### Author

Dirk Eddelbuettel

### License

GPL (>= 2)



