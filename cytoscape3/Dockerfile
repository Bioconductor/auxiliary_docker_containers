FROM ubuntu:14.10

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get dist-upgrade -y 

RUN apt-get install -y \
    openjdk-8-jdk \
    Xvfb

# FIXME - merge w/previous line
RUN apt-get install -y curl 

EXPOSE 1234
 
ADD startx.sh /

RUN curl -O http://chianti.ucsd.edu/cytoscape-3.2.1/cytoscape-3.2.1.tar.gz \
  && tar zxf cytoscape-3.2.1.tar.gz && \
  mkdir -p /root/CytoscapeConfiguration/3/apps/installed


ADD cyREST-v0.9.17.jar /root/CytoscapeConfiguration/3/apps/installed/

RUN cp /cytoscape-unix-3.2.1/Cytoscape.vmoptions /cytoscape-unix-3.2.1/Cytoscape.vmoptions.bak

RUN  echo "-Xms256m" > /cytoscape-unix-3.2.1/Cytoscape.vmoptions
RUN echo "-Xmx2048m" >> /cytoscape-unix-3.2.1/Cytoscape.vmoptions  


CMD ./startx.sh && \
    export DISPLAY=:1.0 && \
    cd /cytoscape-unix-3.2.1 && \
    ./cytoscape.sh
