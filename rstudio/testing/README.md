[![Build Status](https://travis-ci.org/rocker-org/rocker.svg?branch=master)](https://travis-ci.org/rocker-org/rocker)

# rocker/rstudio #


## Quickstart

Start an RStudio server container. From the docker window: 

```bash
sudo docker run -d -p 8787:8787 rocker/rstudio
```

Use the `docker-machine ip` to determine the ip address for your local or remote machine command, then visit that address
appended with the port `:8787`.  You can now log in to the session with the default username and password.

- username: rstudio 
- password: rstudio


For customization details, including custom passwords & shared volumes see [Using the Rstudio image](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image)

## Status ##

Anyone interested in proposing or collaborating on additional use cases should read our [guide to contributing](https://github.com/rocker-org/rocker/wiki/How-to-contribute) and [get in touch](http://github.com/rocker-org/rocker/issues)

## License ##

The Dockerfiles in this repository are licensed under the GPL 2 or later.

## Trademarks ##

RStudio is a registered trademark of RStudio, Inc.  The use of the trademarked term RStudio and the distribution of the RStudio binaries through the images hosted on [hub.docker.com](https://registry.hub.docker.com/) has been granted by explicit permission of RStudio.  Please review [RStudio's trademark use policy](http://www.rstudio.com/about/trademark/) and address inquiries about further distribution or other questions to [permissions@rstudio.com](emailto:permissions@rstudio.com).
