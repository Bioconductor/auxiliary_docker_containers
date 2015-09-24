# Docker Container for AnnotationHub Server

## Prerequisites

Set the environment variable `MYSQL_REMOTE_PASSWORD` to
the correct value, found in the "AnnotationHub production
server" section of the Google Doc "Credentials For
Bioconductor Cloud resources".

The container will not work properly unless this is set.


[Install docker](https://docs.docker.com/installation/.
If you are on Mac or Windows,
install [docker toolbox](https://www.docker.com/toolbox)
instead.

Also install [Docker Compose](https://docs.docker.com/compose/install/).

Clone the AnnotationHubServer3.0 code to the same directory as 
this README:

    git clone https://github.com/Bioconductor/AnnotationHubServer3.0.git

Or if you already have this repository checked out elsewhere
on your system, make a symbolic link to it in the current directory
(the same directory as this README).

Create a directory called "data" in the same directory as
this README.


## To Run The Container

Open a terminal window (a Docker Quickstart Terminal if
you are on Mac or windows) and change to the same
directory where this README is. Issue the command:

    docker-compose up

This command will *pull down the database contents
from the production AnnotationHub server* and then
start a local server.

When you see a line like this:

    annotationhub_1 | == Shotgun/WEBrick on http://0.0.0.0:3000/

...the AnnotationHub server is running in the container.

To verify that it is running, you can determine its URL
(in the next section).

## Determining URL of server

If you are on linux, the URL of the server is likely
[http://localhost:3000/resource](http://localhost:3000/resource).

If you are using boot2docker (deprecated by Docker Toolbox),
you can determine your Docker host's IP address with the command
`boot2docker ip`. If this returns `1.2.3.4`, your URL
would be `http://1.2.3.4:3000/resource`. 

If you are using Docker Toolbox, the command to determine
your Docker host's IP address is 

    docker-machine ip default

If this returns `1.2.3.4`, your URL would be
`http://1.2.3.4:3000/resource`.

