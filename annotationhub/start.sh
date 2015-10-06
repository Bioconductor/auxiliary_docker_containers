#!/bin/sh

cd /tmp

echo get database from master
mysqldump --password=$MYSQL_REMOTE_PASSWORD -u ahuser -h annotationhub.bioconductor.org annotationhub | gzip > /tmp/dump.sql.gz

echo create local database and user
cat /tmp/start.sql | sed "s/MYSQL_REMOTE_PASSWORD/$MYSQL_REMOTE_PASSWORD/" |  mysql -u root --password=$MYSQL_ROOT_PASSWORD -h db

echo populate local database
zcat /tmp/dump.sql.gz | mysql -u root --password=$MYSQL_ROOT_PASSWORD -h db annotationhub

curl http://annotationhub.bioconductor.org/metadata/annotationhub.sqlite3 > /AnnotationHubServer3.0/annotationhub.sqlite3

cd /AnnotationHubServer3.0

cat /tmp/config.yml | sed "s/MYSQL_REMOTE_PASSWORD/$MYSQL_REMOTE_PASSWORD/" > config.yml

echo start app
#ruby app.rb
shotgun -o 0.0.0.0 -p 3000 app.rb

sleep infinity

