FROM bioconductor/devel_small

MAINTAINER dtenenba@fredhutch.org

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y telnet

RUN R -e "biocLite('RSclient')"

# example of use. Start server:

# docker run -d --name server dtenenba/rserve_server_devel

# Then start me:

# docker run --rm -ti --link server:server dtenenba/rserve_client_devel /bin/bash

# Then in the client container you can inspect /etc/hosts and
# contents of the environment, then start R and:

# > library(RSclient)
# > conn <- RS.connect("server")
# > search()
#  [1] ".GlobalEnv"            "package:RSclient"      "package:stats"        
#  [4] "package:graphics"      "package:grDevices"     "package:utils"        
#  [7] "package:datasets"      "package:BiocInstaller" "package:methods"      
# [10] "Autoloads"             "package:base"         
# > RS.eval(conn, search())
#  [1] ".GlobalEnv"           "package:IRanges"      "package:S4Vectors"   
#  [4] "package:stats4"       "package:BiocGenerics" "package:parallel"    
#  [7] "package:stats"        "package:graphics"     "package:grDevices"   
# [10] "package:utils"        "package:datasets"     "package:methods"     
# [13] "Autoloads"      

# Note that IRanges is already loaded on the server, so you could
# call a function in IRanges without paying the penalty of loading
# IRanges on the client. (IRanges does not take that long to load
# so this is a toy example, but the use case is real; we have some
# galaxy tools that do trivial calculations that take seconds, but
# loading the requisite packages takes minutes, so by linking
# a server container to a client container we drastically
# improve performance.)