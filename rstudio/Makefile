testing/Dockerfile: .PHONY
	## Get the Dockerfile and userconf.sh from rocker-versioned/rstudio
	wget -O testing/Dockerfile https://raw.githubusercontent.com/rocker-org/rocker-versioned/master/rstudio/Dockerfile
	wget -O testing/userconf.sh https://raw.githubusercontent.com/rocker-org/rocker-versioned/master/rstudio/userconf.sh
	## Use r-base instead of r-ver
	sed -i 's/r-ver:latest/r-base/' testing/Dockerfile
	## We need libssl1.0.0 from jessie still, but libcurl4 from unstable to match r-base
	sed -i 's/libcurl4-openssl-dev/libcurl4-openssl-dev\/unstable libssl1.0.0\/stable/' testing/Dockerfile
	sed -i 's/apt-get update/echo deb http:\/\/ftp.de.debian.org\/debian jessie main >> \/etc\/apt\/sources.list \&\& apt-get update/' testing/Dockerfile
	## Remove trailing slash
	sed -i 's/## hack to avoid.*/\&\& ls/' testing/Dockerfile
	## Remove links since R is already in /usr/lib
	sed -i 's/&& ln -s \/usr\/local.*//g' testing/Dockerfile

.PHONY:
	echo "updating testing (r-base -- based version) of rstudio"
