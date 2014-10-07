
# Run in parallel: make -j
FLAGS=--no-cache


all:
	$(MAKE) first
	$(MAKE) second
	$(MAKE) third

first: debian-r-base ubuntu-r-base
second: debian-r-devel debian-rstudio ubuntu-rstudio ubuntu-r-devel
third: debian-hadleyverse ubuntu-hadleyverse


debian-r-base: debian/r-base/Dockerfile
	docker build $(FLAGS) -t eddelbuettel/debian-r-base debian/r-base

debian-r-devel: debian/r-devel/Dockerfile
	docker build $(FLAGS) -t eddelbuettel/debian-r-devel debian/r-devel

debian-rstudio: debian/rstudio/Dockerfile
	docker build $(FLAGS) -t eddelbuettel/debian-rstudio debian/rstudio

debian-hadleyverse: debian/hadleyverse/Dockerfile
	docker build $(FLAGS) -t eddelbuettel/debian-hadleyverse debian/hadleyverse

ubuntu-r-base: ubuntu/r-base/Dockerfile
	docker build $(FLAGS) -t eddelbuettel/ubuntu-r-base ubuntu/r-base

ubuntu-r-devel: ubuntu/r-devel/Dockerfile
	docker build $(FLAGS) -t eddelbuettel/ubuntu-r-devel ubuntu/r-devel

ubuntu-rstudio: ubuntu/rstudio/Dockerfile
	docker build $(FLAGS) -t eddelbuettel/ubuntu-rstudio ubuntu/rstudio

ubuntu-hadleyverse: ubuntu/hadleyverse/Dockerfile
	docker build $(FLAGS) -t eddelbuettel/ubuntu-hadleyverse ubuntu/hadleyverse


pull:
	docker pull eddelbuettel/debian-r-base
	docker pull eddelbuettel/debian-r-devel
	docker pull eddelbuettel/debian-rstudio
	docker pull eddelbuettel/debian-hadleyverse
	docker pull eddelbuettel/ubuntu-r-base
	docker pull eddelbuettel/ubuntu-r-devel
	docker pull eddelbuettel/ubuntu-rstudio
	docker pull eddelbuettel/ubuntu-hadleyverse


# delete: docker rmi eddelbuettel/debian-r-base eddelbuettel/ubuntu-r-base eddelbuettel/debian-r-devel eddelbuettel/debian-rstudio eddelbuettel/ubuntu-r-devel eddelbuettel/ubuntu-rstudio eddelbuettel/debian-hadleyverse eddelbuettel/ubuntu-hadleyverse

clean:
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q --filter "dangling=true")
