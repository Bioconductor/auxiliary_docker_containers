#!/bin/bash

cd /biostar-central
. /conf/default.env

echo "create user biostar password '$POSTGRES_PASSWORD';create database biostar owner biostar;" | psql -U postgres -h db

./biostar.sh init
echo "redirecting import output to /dev/null to save some time..."
./biostar.sh import > /dev/null 2>&1
./biostar.sh index
./biostar.sh run
sleep infinity

