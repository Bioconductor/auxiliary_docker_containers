#!/bin/sh

chown -R roundup /bioc_submit

cd /roundup
python setup.py install

cd /bioc_submit

# do this as the user roundup in /bioc_submit :
#roundup-server -C ./config.ini -n 0.0.0.0 name=.



# mysql -h db -u root --password=$MYSQL_ROOT_PASSWORD

echo  "create database roundup_bioc_submit;create user 'roundup'@'%' identified by 'roundup_pw';grant all privileges on roundup_bioc_submit.*  to 'roundup'@'%';flush privileges;" | \
    mysql -h db -u root --password=$MYSQL_ROOT_PASSWORD

cat /start/init_tracker | roundup-admin -i /bioc_submit -u roundup

# echo sleeping
# sleep infinity

rm -rf /tmp/*.log

echo "starting server..."
su - roundup -c 'cd /bioc_submit && roundup-server -n 0.0.0.0 bioc_submit=/bioc_submit'
sleep infinity
