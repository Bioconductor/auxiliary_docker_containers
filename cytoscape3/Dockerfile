FROM ubuntu:14.04

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get dist-upgrade -y 

RUN apt-get install -y \
    openjdk-7-jdk \
    Xvfb

# FIXME - merge w/previous line
RUN apt-get install -y curl 

EXPOSE 1234
 
ADD startx.sh /

RUN curl -O http://chianti.ucsd.edu/cytoscape-3.2.1/cytoscape-3.2.1.tar.gz \
  && tar zxf cytoscape-3.2.1.tar.gz && \
  mkdir -p /root/CytoscapeConfiguration/3/apps/installed


ADD cyREST-v0.9.17.jar /root/CytoscapeConfiguration/3/apps/installed/

CMD ./startx.sh && \
    export DISPLAY=:1.0 && \
    cd /cytoscape-unix-3.2.1 && \
    ./cytoscape.sh
