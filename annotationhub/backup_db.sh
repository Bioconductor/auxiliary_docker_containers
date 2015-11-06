#!/bin/bash

mysqldump -u root --password=$MYSQL_ROOT_PASSWORD -h db annotationhub | gzip > /data/annotationhub.sql.gz
