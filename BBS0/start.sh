#!/bin/bash

#echo be sure and run 'userconf.sh && su $USER'!
#chmod -R a+rw central_rdir
docker run -ti --rm -h dockernode \
    -w /home/biocbuild \
    --volumes-from=BBSdata \
    -e USER=biocbuild \
    --user=biocbuild \
    dtenenba/bbs0  "bash"

#    -v $HOME/dev/github/BBS-gitsvn:/home/biocbuild/BBS \

#     -v $(pwd)/central_rdir:/home/biocbuild/public_html/BBS/3.1/bioc \
