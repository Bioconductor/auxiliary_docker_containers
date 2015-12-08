# Docker Container for AnnotationHub Server

## Important Note

The way this Docker Container is currently set up,
it can only be used by Bioconductor core members
who have access to the production server
and know its credentials.

It should probably change so it can be used by
anyone who wants to test recipes. But that
is not going to happen right away.



## Prerequisites

Set the environment variable `MYSQL_REMOTE_PASSWORD` to
the correct value, found in the "AnnotationHub production
server" section of the Google Doc "Credentials For
Bioconductor Cloud resources".

The container will not work properly unless this is set.

You can set it by doing:

    export MYSQL_REMOTE_PASSWORD=XXX

where XXX is replaced with the correct password.

[Install docker](https://docs.docker.com/installation/).
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

If you are in the cloud you need to use the public DNS name of your instance
as your IP address.

If you are using boot2docker (deprecated by Docker Toolbox),
you can determine your Docker host's IP address with the command
`boot2docker ip`. If this returns `1.2.3.4`, your URL
would be `http://1.2.3.4:3000/resource`. 

If you are using Docker Toolbox, the command to determine
your Docker host's IP address is 

    docker-machine ip default

If this returns `1.2.3.4`, your URL would be
`http://1.2.3.4:3000/resource`.

## Using the container

Start a new R session in a new terminal window. 
Assuming your server URL 
is `http://1.2.3.4:3000/resource`, enter the following
at the R prompt:

    options(AH_SERVER_POST_URL="http://1.2.3.4:3000/resource",
    ANNOTATION_HUB_URL="http://1.2.3.4:3000")

Replace the URL with your actual URL, of course.
Now you can load `AnnotationHub` and `AnnotationHubData`.

Now you can run recipes, etc. and the insertions will
happen inside the docker container, not in the production
database.

When you are satisfied that the changes you have made are 
correct, you can update the production database (see next
section). If you have messed up and you don't want to
push your changes to production, you can just exit
the container (press Control-C in the window where it is
running) and start over again.

## Pushing changes to production

You need to back up the database inside the docker 
container. You can do it like this:

     docker exec annotationhub_annotationhub_1 bash /bin/backup_db.sh

Note that `annotationhub_annotationhub_1` is the name of the
docker container that has the annotation hub server on it; this
name may vary, the `docker ps` command will give you the
accurate container name.

Now in the `data` directory on your local machine, 
there is a file called `annotationhub.sql.gz`. You 
can upload this to the production machine and
use it to replace the production database
(after backing it up).




