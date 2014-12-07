#!/bin/bash

echo "cd'ing to /biostar-central"
cd /biostar-central
echo "sourcing default.env"
. /conf/default.env
echo "pwd is `pwd`"
echo "ls is `ls`"
echo "running ./biostar.sh"

echo "create user biostar password '$POSTGRES_PASSWORD';create database biostar owner biostar;" | psql -U postgres -h db

./biostar.sh init import run
