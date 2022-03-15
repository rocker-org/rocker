
## r-edge/gcc-{11,12}

Dockerfile for _very bleeding edge_ `gcc` (or `g++` or `gfortran` use)

### Initial Context

In early Dec 2020, an email from CRAN noted that my
[RcppTOML](https://github.com/eddelbuettel/rcpptoml) package was not building
under the (then still unreleased !!)  `gcc-11` compiler.

A fix was already suggested: adding another include header, a not-uncommon change under new
compilers.  Now the task was to check this.

Getting a brand new (and unreleased) compiler onto a system is an undertaking, and possibly
destabilizing to the system. Using a container is a _perfect_ use case for this.  Doing so only took
me a few minutes but revealed one or two issue which make documenting the process in the Dockerfile
a good idea. 

Once the compiler was built, updating and checking the package was breeze, and the update is now
pending at CRAN.

### Updated Context

About fifteen months later, some users are asked to update under `gcc-12` (or
`g++-12`) so we added another image: `r-edge:gcc-12`. It is currently also
the default `:latest` image one obtains via `docker pull rocker/r-edge`.

#### Details

Brandnew (at the time: `gcc-10` and `gcc-11`) builds exists within the usual
[toolchain PPA](https://launchpad.net/~ubuntu-toolchain-r) repository in the
[volatile
packages](https://launchpad.net/~ubuntu-toolchain-r/+archive/ubuntu/volatile)
sub-repository where `gcc-11` exists for the (then) most current [Ubuntu
21.04
'hirute'](https://launchpad.net/~ubuntu-toolchain-r/+archive/ubuntu/volatile?field.series_filter=hirsute)
development release (and similarly now for 'jammy', the upcoming 22.04
release).  After that it is mostly a matter of adding packages needed by the
build, in this case only [Rcpp](https://www.rcpp.org).

### Status and Outlook

This Dockerfile is unlikely to be updated "regularly" but can serve as basis for future rebuilds as
they are needed.  We had similar issues in the past, so where may well be a future need for it. The
directory structure will also allow for `clang-12` or `gcc-12` or ... (which
is what we did for `gcc-12`).

The `gcc-11` and `gcc-12` configurations will be built at Docker Hub under
`r-edge` with a suitable tag.

### Author

Dirk Eddelbuettel

### License

GPL (>= 2) as usual
