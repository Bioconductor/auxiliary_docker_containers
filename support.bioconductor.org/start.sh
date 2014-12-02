#!/bin/bash

echo "cd'ing to /biostar-central"
cd /biostar-central
echo "sourcing default.env"
. /conf/default.env
echo "pwd is `pwd`"
echo "ls is `ls`"
echo "running ./biostar.sh"
./biostar.sh init import index run