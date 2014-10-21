## Introducing Rocker: Docker for R


> You only know two things about Docker. First, it uses Linux
> containers. Second, the Internet won't shut up about it.
>
> -- attributed to Solomon Hykes, Docker CEO

### So what is Docker?

<!-- Docker is also the name of the company

Their Trademark terms of use request that we refer to the software as
"Docker software" or similar term (e.g. as an ajective), and only use "Docker" as
a noun when refering to the company.  You think they might have guessed
how hopeless that request was, so I'm not going to insist we use it as an adjective...
-->

<!-- or maybe omit this
![](https://d3oypxn00j2a10.cloudfront.net/0.11.2/images/pages/brand_guidelines/small_v.png)
-->

[Docker](http://www.docker.com) is a relatively new [open
source](https://github.com/docker/docker/tree/master/LICENSE) application
and service, which is seeing interest across a number of areas. It
uses recent Linux kernel features (containers, namespaces) to shield
processes. While its use (superficially) resembles the use of virtual
machines, it is _much more lightweight_ as it operates at the level of a
single process (rather than an emulation of entire OS layer).  This also
allows it to start almost instantly, require very little resources and
hence permit an order of magnitude more deployments per hosts than a
virtual machine.

<!-- Guess it's not clear that the purpose is to package/distribute
other software, as opposed to something you just install and use by itself?
(or perhaps it's obvious via the analogy to VMs?)-->

[Docker](http://www.docker.com) offers a standard interface
to creation, distribution and deployment. The _shipping
container_ analogy is apt: just how shipping containers (via
their standard size and "interface") allow global trade to
prosper, Docker is aiming for nothing less for deployment.  A
[Dockerfile](https://docs.docker.com/articles/dockerfile_best-practices/)
provides a concise, extensible, and executable description
of the computational environment. Docker software then builds a
[Docker image](https://docs.docker.com/userguide/dockerimages/)
from the Dockerfile.  Docker images are analogous to virtual machine images,
but smaller and built in discrete, extensible layers. Images can be
distributed and run on any machine that has Docker software
installed. Running instances are called [Docker
containers](https://docs.docker.com/userguide/usingdocker/). A single
machine can run hundreds of containers, including multiple containers
running the same image.

<!-- Define: Dockerfile, image, container --> <!-- Ugh, not sure that
helped. container vs image is probably particularly confusing. Do we
need to explain layers? Docker hub? -->


[Docker](http://www.docker.com) introductions are tutorials are available.
The [official online tutorial](https://docs.docker.com/) is a good place to start; this post can not
go into more detail in order to remain short and introductory.

<!-- Wasn't sure which tutorial you had in mind. Maybe we should link the interactive one instead? https://www.docker.com/tryit/
My only issue is that all Docker's tutorials start with interactive containers and none of them actually cover Dockerfiles...
-->

### So what is Rocker?

![](https://en.gravatar.com/userimage/73204427/563567819bd642c7a9e3af9d8ddb7581.png?size=100)

At it's core, Rocker is a project for running R using Docker
containers. We provide a collection of Dockerfiles and pre-built Docker
images that can be used and extended for many purposes.

<!-- and also documentation?  -->

[Rocker](https://github.com/rocker-org/rocker) is the the name of our
[GitHub](https://github.com/) repository contained with the
[Rocker-Org](https://github.com/rocker-org) GitHub organization.

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


#### Rocker Use Case Containers

Within the Rocker-org organization on GitHub, we are also working on

+ [hadleyverse](https://registry.hub.docker.com/u/rocker/hadleyverse/) which
  extends the rstudio container with a number of Hadley packages
+ [rOpenSci](https://registry.hub.docker.com/u/rocker/ropensci/) which
  extends hadleyverse with a number of [rOpenSci](http://ropensci.org/) packages
+ [r-devel-san](https://registry.hub.docker.com/u/rocker/r-devel-san/)
  provides an R-devel build for "Sanitizer" run-time diagnostics via a properly
  instrumented version of R-devel via a recent compiler build
+ [rocker-versioned](https://github.com/rocker-org/rocker-versioned)
  aims to provided containers with 'versioned' previous R releases and matching packages

<!-- something about welcoming PRs for additional things here? not sure how we want to handle that-->

### Deprecation

The Rocker effort supersedes and replaces earlier work by Dirk (in the
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


### Acknowledgments

We are very appreciative of all comments received by early adopters and
testers. We also would like to thank RStudio for allowing us the
redistribution of their RStudio Server binary.


### Authors

[Dirk Eddelbuettel](http://dirk.eddelbuettel.com) and
[Carl Boettiger](http://www.carlboettiger.info/)


