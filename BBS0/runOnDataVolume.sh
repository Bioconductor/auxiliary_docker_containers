#!/bin/sh

cp -r /xfer/* /home/biocbuild/public_html/BBS/3.1/bioc
chmod -R a+rw /home/biocbuild/public_html/BBS/3.1/bioc
# echo "about to sleep forever"
# tail -f /dev/null