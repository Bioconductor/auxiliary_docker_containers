FROM ubuntu:14.04

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get dist-upgrade -y 

RUN apt-get install -y \
    openjdk-7-jdk \
    Xvfb

# FIXME - merge w/previous line
RUN apt-get install -y curl 


ADD startx.sh /

RUN cd /tmp && \
    curl -O http://chianti.ucsd.edu/Cyto-2_8_0/cytoscape-2.8.0.tar.gz && \
    tar zxf cytoscape-2.8.0.tar.gz -C / && \
    rm cytoscape-2.8.0.tar.gz


ADD CytoscapeRPC.jar /cytoscape-2.8.0/plugins/
ADD CytoscapeRPC.conf /cytoscape-2.8.0/
ADD Cytoscape.vmoptions /cytoscape-2.8.0/

EXPOSE 9000

CMD cd / && \
    ./startx.sh && \
    export DISPLAY=:1.0 && \
    cd /cytoscape-2.8.0 && \
    sleep 3 && \
    ./cytoscape.sh


