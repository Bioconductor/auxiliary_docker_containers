#!/bin/bash

docker run -ti --rm -h dockernode \
    --name biocbuild \
    -w /home/biocbuild \
    --volumes-from=BBSdata \
    -e USER=biocbuild \
    dtenenba/bbs0 
