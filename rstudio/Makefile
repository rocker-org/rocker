testing/Dockerfile: .PHONY
	wget -O testing/Dockerfile https://raw.githubusercontent.com/rocker-org/rocker-versioned/master/rstudio/Dockerfile
	wget -O testing/userconf.sh https://raw.githubusercontent.com/rocker-org/rocker-versioned/master/rstudio/userconf.sh
	sed -i 's/r-ver:latest/r-base/' testing/Dockerfile
	sed -i 's/libcurl4-openssl-dev/libcurl4-openssl-dev\/unstable libssl1.0.0\/stable/' testing/Dockerfile
	sed -i 's/apt-get update/echo deb http:\/\/ftp.de.debian.org\/debian jessie main >> \/etc\/apt\/sources.list \&\& apt-get update/' testing/Dockerfile
	sed -i 's/&& ln -s/# && ln -s/g' testing/Dockerfile
.PHONY:
	echo "updating testing (r-base -- based version) of rstudio"
