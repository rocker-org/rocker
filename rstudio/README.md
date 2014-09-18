## Docker for ROpenSci

This repository provides Dockerfiles for provisioning a completely
portable environment for reproducible research in R.


## Getting started:


On a Mac or Windows machine, you'll need boot2docker
installed (easy point & click install, ~24 MB).
([[Mac](https://docs.docker.com/installation/mac/)],
[[Windows](https://docs.docker.com/installation/windows/)])


1) Launch boot2docker, and do:

```bash
sudo docker run -d -p 8787:8787 cboettig/ropensci
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


### On Ubuntu, other Linux flavors

Life is easier.  Install the latest version of docker
via a script: (Other flavors are similar, see: [Docker's
instructions](https://docs.docker.com/installation) for your favorite
distro)

```bash
curl -sSL https://get.docker.io/ubuntu/ | sudo sh
```

Now we're good to roll:

```bash
sudo docker run -d -p 8787:8787 cboettig/ropensci
```
RStudio should now be at `http://localhost:8787` with login as mentioned above.


## Details and custom configuration

- Customize the user name, password, and email address used in git config:

```bash
docker run -d -p 8787:8787 -e USER=<username> -e PASSWORD=<password> -e EMAIL=you@somewhere.com cboettig/ropensci
```

- Launch an R terminal session instead of using Rstudio

```bash
docker run --rm -it cboettig/ropensci /usr/bin/R
```

- Launch a bash session

```bash
docker run --rm -it cboettig/ropensci /bin/bash
```

- Link the container to a local folder (directory) using the `-v` option
(linux only?). This acts much like running `R` in the working directory:

```bash
docker run --rm -it -v $(pwd):/home/rstudio/$(basename "$PWD") cboettig/ropensci /usr/bin/R
```

- Use a lighter weight RStudio image: the commands above use the image
named `cboettig/ropensci` from the Docker Hub, which includes many
commonly used R packages (see Dockerfile under `ropensci/` in thsi repo).
For a lighter-weight image, use `cboettig/rstudio`.

## Author

Carl Boettiger <cboettig@ropensci.org>

## License

MIT

## Trademark

RStudio and Shiny are registered trademarks of RStudio,
Inc.  The use and distribution of these RStudio Marks
with the RStudio binaries through these images hosted on
[hub.docker.com](https://registry.hub.docker.com/u/cboettig/rstudio/)
has been granted by explicit permission of
RStudio, as described under [RStudio's trademark use
policy](http://www.rstudio.com/about/trademark/). Address
inqueries about further distribution or other questions to
[permissions@rstudio.com](emailto:permissions@rstudio.com).
