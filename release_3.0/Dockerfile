FROM ubuntu:latest

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

RUN rm -rf /tmp/R-source && \
    mkdir /tmp/R-source && \
    curl -sL http://cran.r-project.org/src/base/R-latest.tar.gz && \
    tar -xJC /tmp/R-source && \
    cd /tmp/R-source/R-* && \
    ./configure --enable-R-shlib && \
    make && \
    make install


RUN R -e "source('http://bioconductor.org/biocLite.R')"
RUN echo "library(BiocInstaller)" > /root/.Rprofile


