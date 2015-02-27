#!/bin/bash

docker run -ti --rm -h dockernode \
    -p 9191:9191 \
    --name biocbuild \
    -w /home/biocbuild \
    --volumes-from=BBSdata \
    -e USER=biocbuild \
    dtenenba/bbs0 
