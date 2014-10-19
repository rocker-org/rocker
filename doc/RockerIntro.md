## Introducing Rocker: Docker for R


> You only know tow things about Docker. First, it uses Linux  
> containers. Second, the Internet won't shut up about it.  
>  
> -- attributed to Solomon Hykes, Docker CEO

### So what is Docker?

[Docker](http://www.docker.com) is a relatively new application and service,
which is seeing interest across a number of areas. It uses recent Linux
kernel features (containers, namespaces) to shield processes. While its use
(superficially) resembles the use of virtual machines, it is _much more
lightweight_ as it operates at the level of a single process (rather than an
emulation of entire OS layer).  This also allows it to start almost
instantly, require very little resources and hence permit an order of
magnitude more deployments per hosts than a virtual machine.

[Docker](http://www.docker.com) offeres a standard interface to creation,
distribution and deployment.  The _shipping container_ analogy is apt: just
how shipping containers (via their standard size and "interface") allow
global trade to prosper, Docker is aiming for nothing less for deployment.

[Docker](http://www.docker.com) offers advantages for development, testing,
and distribution.  Because of it single process model, and its ability to get
started and removed almost instantaneously, it is ideally suited for
development builds, builds under different configuration, or builds with
experimental or test use cases.

[Docker](http://www.docker.com) introductions are tutorials are available. 
The [official online tutorial] is a good place to start; this post can not
go into more detail in order to remain short and introductory.

### So what is Rocker?

[Rocker](https://github.com/rocker-org/rocker) is the the name of our
[GitHub]((https://github.com/) repository contained with the RockerOrg GitHub organization.

[Rocker](https://hub.docker.com/account/organizations/rocker/) is also the
name the account under which the automated builds at [Docker](http://www.docker.com) provide
containers ready for download.

### Current Rocker Status

#### Core Rocker Containers

The Rocker project develops the following containers in the core Rocker repository

+ [r-base](https://registry.hub.docker.com/u/rocker/r-base/) provides a base
  R container to build from
+ [r-devel](https://registry.hub.docker.com/u/rocker/r-devel/) provides the
basic R container, as well as a complete R-devel build based on current SVN
sources of R
+ [rstudio](https://registry.hub.docker.com/u/rocker/rstudio/) provides the
base R container as well an
[RStudio Server](http://www.rstudio.com/products/rstudio/) instance
+ [r-devel-san](https://registry.hub.docker.com/u/rocker/r-devel-san/)
provides an R-devel build for "Sanitizer" run-time diagnostics via a properly
instrumented version of R-devel via a recent compiler build


#### Rocker Use Case Containers

Within the Rocker-org organization on GitHub, we are also working on

+ [hadleyverse](https://registry.hub.docker.com/u/rocker/hadleyverse/) which
  extends the rstudio container with a number of Hadley packages
+ [rOpenSci](https://registry.hub.docker.com/u/rocker/ropensci/) which
  extends hadleyverse with a number of [rOpenSci](http://ropensci.org/) packages
+ R-versioned aims to provided containers with 'versioned' previous R
  releases and matching packages


### Deprecation

The Rocker effort supercedes and replaces earlier work by Dirk (in the
docker-debian-r and docker-ubuntu-r GitHub repositories) and Carl.  Please
use the [Rocker GitHub repo](https://github.com/rocker-org/rocker) and
[Rocker Containers from Docker.com](https://hub.docker.com/account/organizations/rocker/)
going forward.


### Next Steps 

We intend to follow-up with more posts detailed usage of both the source
Dockerfiles and binary containers on different platforms.

Rocker containers are fully functional. We invite you to take them for a
spin. Bug reports, comments, and suggestions are welcome; we suggest you use the
[GitHub issue tracker](https://github.com/rocker-org/rocker/issues).


### Acknowledgement

We are very appreciative of all comments received by early adopters and
testers. We also would like to thank RStudio for allowing us the
redistribution of their RStudio Server binary.


### Authors

[Dirk Eddelbuettel](http://dirk.eddelbuettel.com) and
[Carl Boettiger](http://www.carlboettiger.info/)


