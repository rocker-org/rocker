## Docker with RStudio



## Getting started:


On a Mac or Windows machine, you'll need boot2docker
installed (easy point & click install, ~24 MB).
([[Mac](https://docs.docker.com/installation/mac/)],
[[Windows](https://docs.docker.com/installation/windows/)])


1) Launch boot2docker, and do:

```bash
sudo docker run -d -p 8787:8787 eddelbuettel/debian-rstudio
```

That will take a while to download the image the first time you run it.

2) Once it is done, try:

```bash
boot2docker ip
```
that should return an ip address you can paste into your browser.

3) Add a `:8787` to the end of this address and paste it into your
browser address bar. (e.g. it's probably `http://92.168.59.103:8787`
but that can change).

4) You should get the RStudio welcome screen.  you should be able to
login with user/password `rstudio/rstudio`, and be able to run stuff,
install packages, use git, etc.


### On Ubuntu/Linux (local or remote machines)

Docker runs natively on Linux. This is also a great way to deploy
RStudio on a cloud server, to scale up your computations, share
with collaborators, or just to be able to run RStudio from the
browser of your ipad. [DigitalOcean](http://digitalocean.com) makes
it very easy to set up a Linux cloud server for a less than 1 cent
per hour.


Install the latest version of docker
via a script: (Other flavors are similar, see: [Docker's
instructions](https://docs.docker.com/installation) for your favorite
distro), e.g. ubuntu:

```bash
curl -sSL https://get.docker.io/ubuntu/ | sudo sh
```

And launch the docker container:

```bash
sudo docker run -d -p 8787:8787 eddelbuettel/debian-rstudio
```

RStudio should now be at `http://localhost:8787` with login as mentioned above.
On a remote server, replace `localhost` with the public IP address.


## Details and custom configuration

- Customize the user name, password, and email address used in git config:

```bash
docker run -d -p 8787:8787 -e USER=<username> -e PASSWORD=<password> -e EMAIL=you@somewhere.com eddelbuettel/debian-rstudio
```

- Launch an R terminal session instead of using Rstudio

```bash
docker run --rm -it eddelbuettel/debian-rstudio /usr/bin/R
```

- Launch a bash session

```bash
docker run --rm -it eddelbuettel/debian-rstudio /bin/bash
```

- Link the container to a local folder (directory) using the `-v` option
(linux only?). This acts much like running `R` in the working directory:

```bash
docker run --rm -it -v $(pwd):/home/rstudio/$(basename "$PWD") eddelbuettel/debian-rstudio /usr/bin/R
```

- Use a lighter weight RStudio image: the commands above use the image
named `eddelbuettel/debian-rstudio` from the Docker Hub, which includes many
commonly used R packages (see Dockerfile under `ropensci/` in thsi repo).
For a lighter-weight image, use `cboettig/rstudio`.

## Author

Carl Boettiger <cboettig@ropensci.org>

## Trademark

RStudio is a registered trademarks of RStudio,
Inc.  The use and distribution of these RStudio Marks
with the RStudio binaries through these images hosted on
[hub.docker.com](https://registry.hub.docker.com/u/cboettig/rstudio/)
has been granted by explicit permission of
RStudio, as described under [RStudio's trademark use
policy](http://www.rstudio.com/about/trademark/). Address
inqueries about further distribution or other questions to
[permissions@rstudio.com](emailto:permissions@rstudio.com).
