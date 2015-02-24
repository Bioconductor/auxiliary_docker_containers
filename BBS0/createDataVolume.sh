#!/bin/bash

docker run --name BBSdata -v /home/biocbuild/public_html/BBS/3.1/bioc \
  -v $HOME/dev/github/BBS-gitsvn:/home/biocbuild/BBS -ti busybox \
  chmod -R a+rw /home/biocbuild/public_html/BBS/3.1/bioc