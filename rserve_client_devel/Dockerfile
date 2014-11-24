FROM dtenenba/devel_3.1

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y telnet

RUN R -e "biocLite('RSclient')"

# example of use. Start server:

# docker run -d --name server dtenenba/rserve_server_devel

# Then start me:

# docker run --rm -ti --link server:server dtenenba/rserve_client_devel /bin/bash

# Then in the client container you can inspect /etc/hosts and
# contents of the environment, then start R and:
# library(RSclient)
# 