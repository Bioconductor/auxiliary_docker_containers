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

# Depending on the Bioc version, you may need to download R-latest
# here, or R-devel instead.

RUN rm -rf /tmp/R-source && \
    mkdir /tmp/R-source && \
    curl -SL ftp://ftp.stat.math.ethz.ch/Software/R/R-devel.tar.gz && \
    tar -xJC /tmp/R-source && \
    cd /tmp/R-source/R-* && \
    ./configure --enable-R-shlib && \
    make && \
    make install


RUN R -e "source('http://bioconductor.org/biocLite.R')"
# Uncomment the following if Bioc-devel runs in a release 
# version of R:
# RUN R -e "library(BiocInstaller);useDevel()"
RUN echo "library(BiocInstaller)" > /root/.Rprofile


