## Emacs, make this -*- mode: sh; -*-

FROM r-base:latest

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/rocker-org/rocker" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
                pandoc-citeproc \
                r-cran-knitr \
		r-cran-rmarkdown \
                r-cran-runit \
                r-cran-testthat \
                texinfo \
                texlive-fonts-extra \
                texlive-fonts-recommended \
                texlive-latex-extra \
                texlive-latex-recommended \
                texlive-luatex \
                texlive-xetex \
        && mkdir ~/.R \
        && echo _R_CHECK_FORCE_SUGGESTS_=FALSE > ~/.R/check.Renviron 

CMD ["bash"]
