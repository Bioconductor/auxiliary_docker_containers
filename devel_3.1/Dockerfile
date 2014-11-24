FROM ubuntu:14.04

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

RUN rm -rf /tmp/R-source && mkdir /tmp/R-source

# a cron job in dtenenba's crontab on gamay copies the R-devel
# tarball from ftp://ftp.stat.math.ethz.ch/Software/R/R-devel.tar.gz
# to http://s3.amazonaws.com/r-devel-source/R-devel.tar.gz
# every hour, because the ADD instruction does not work on 
# FTP URLs. 
ADD http://s3.amazonaws.com/r-devel-source/R-devel.tar.gz /tmp/R-source/

RUN cd /tmp/R-source && tar -zxf /tmp/R-source/*.tar.gz && \
    rm *.tar.gz && \
    cd R-* && \
    ./configure --enable-R-shlib && \
    make && \
    make install


RUN R -e "source('http://bioconductor.org/biocLite.R')"
# Uncomment the following if Bioc-devel runs in a release 
# version of R:
# RUN R -e "library(BiocInstaller);useDevel()"
RUN echo "library(BiocInstaller)" > /root/.Rprofile


