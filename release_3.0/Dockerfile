FROM ubuntu:14.04

MAINTAINER dtenenba@fredhutch.org

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && apt-get dist-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive \ 
    apt-get build-dep -y r-base

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    curl \
    gdb \
    libcurl4-openssl-dev \
    libxml2-dev \
    valgrind

RUN rm -rf /tmp/R-source && mkdir /tmp/R-source

ADD http://cran.fhcrc.org/src/base/R-latest.tar.gz /tmp/R-source/

RUN cd /tmp/R-source && \
    tar -zxf /tmp/R-source/*.tar.gz && \
    rm *.tar.gz && \
    cd R-* && \
    ./configure --enable-R-shlib && \
    make && \
    make install


RUN R -e "source('http://bioconductor.org/biocLite.R')"
RUN echo "library(BiocInstaller)" > /root/.Rprofile
# uncomment the following if there is an older (than release) bioc that
# runs in this same version of R
# RUN R -e "biocLite('BiocUpgrade')"


