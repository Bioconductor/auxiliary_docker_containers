#!/bin/bash

echo "cd'ing to /biostar-central"
cd /biostar-central
echo "sourcing default.env"
. /conf/default.env
echo "pwd is `pwd`"
echo "running ./biostar.sh"

echo "create user biostar password '$POSTGRES_PASSWORD';create database biostar owner biostar;" | psql -U postgres -h db

./biostar.sh init import
 python manage.py usermod -e 0@foo.bar -p foobar
 ./biostar.sh init run

