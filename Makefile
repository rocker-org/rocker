
# Run in parallel: make -j

all:
	$(MAKE) first
	$(MAKE) second
	$(Make) third

first: debian-r-base ubuntu-r-base
second: debian-r-devel debian-rstudio ubuntu-r-devel ubuntu-rstudio
third: debian-hadleverse ubuntu-hadleverse

debian-r-base: debian/r-base/Dockerfile
	docker build -t eddelbuettel/debian-r-base debian/r-base

debian-r-devel: debian/r-devel/Dockerfile
	docker build -t eddelbuettel/debian-r-devel debian/r-devel

debian-rstudio: debian/rstudio/Dockerfile
	docker build -t eddelbuettel/debian-rstudio debian/rstudio

debian-hadleverse: debian/hadleverse/Dockerfile
	docker build -t eddelbuettel/debian-hadleverse debian/hadleverse

ubuntu-r-base: ubuntu/r-base/Dockerfile
	docker build -t eddelbuettel/ubuntu-r-base ubuntu/r-base

ubuntu-r-devel: ubuntu/r-devel/Dockerfile
	docker build -t eddelbuettel/ubuntu-r-devel ubuntu/r-devel

ubuntu-rstudio: ubuntu/rstudio/Dockerfile
	docker build -t eddelbuettel/ubuntu-rstudio ubuntu/rstudio

ubuntu-hadleverse: ubuntu/hadleverse/Dockerfile
	docker build -t eddelbuettel/ubuntu-hadleverse ubuntu/hadleverse


pull:
	docker pull eddelbuettel/debian-r-base
	docker pull eddelbuettel/debian-r-devel
	docker pull eddelbuettel/debian-rstudio
	docker pull eddelbuettel/debian-hadleverse
	docker pull eddelbuettel/ubuntu-r-base
	docker pull eddelbuettel/ubuntu-r-devel
	docker pull eddelbuettel/ubuntu-rstudio
	docker pull eddelbuettel/ubuntu-hadleverse


# delete: docker rmi eddelbuettel/debian-r-base eddelbuettel/ubuntu-r-base eddelbuettel/debian-r-devel eddelbuettel/debian-rstudio eddelbuettel/ubuntu-r-devel eddelbuettel/ubuntu-rstudio eddelbuettel/debian-hadleverse eddelbuettel/ubuntu-hadleverse


