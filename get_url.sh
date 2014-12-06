#!/bin/bash

if [ -z "$DOCKER_HOST" ]; then
    host="localhost"
else
    host=`echo $DOCKER_HOST |sed  -e "s/tcp:\/\///"|cut -d ":" -f 1`
fi  


int=$(docker port $(docker ps -lq))

if [ -z "$int" ]; then
    echo "couldn't determine port; is a container running?"
    exit 1
fi

port=`echo $int|cut -d ":" -f 2`



url="http://$host:$port"

echo $url
