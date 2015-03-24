FROM ubuntu:14.04

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get dist-upgrade -y 

RUN apt-get install -y \
    openjdk-7-jdk \
    Xvfb

# FIXME - merge w/previous line
RUN apt-get install -y curl 


ADD startx.sh /

RUN mkdir /GENE-E && \
    cd /GENE-E && \
    curl -O http://s3.amazonaws.com/gene-e-jars/GENE-E.jar && \
    curl -O http://s3.amazonaws.com/gene-e-jars/njhdf.jar && \
    curl -O http://s3.amazonaws.com/gene-e-jars/libjhdf5.so

EXPOSE 9998

CMD cd /GENE-E && \
    /startx.sh && \
    export DISPLAY=:1.0 && \
    java -Xmx120m \
    -Dgenee.license=1cb3ca61c418e809c2c6686ad027ad9f \
    -Dgenee.email=jgould@oadinstitute.org \
    -Dgenee.allowMultiple=true \
    -Djava.library.path=/GENE-E \
    -jar GENE-E.jar
