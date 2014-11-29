# A Docker container that builds and runs the Bioconductor website

In order to run this, you need to check out the website code from SVN
(https://hedgehog.fhcrc.org/bioconductor/trunk/bioconductor.org) or github
(https://github.com/Bioconductor/bioconductor.org.git). Assuming you 
check it out into the current directory, this will put the code in 
a directory called bioconductor.org.

In order to run this container, do the following:

(If on linux, you may need to prepend all `docker` commands with `sudo`)

    docker run  --rm --name website -P -v `pwd`/bioconductor.org:/bioconductor.org \
    dtenenba/bioconductor.org

The first time this command is run, it will pull down the `dtenenba/bioconductor.org`
image which may take a few moments. 

(If you want to view/edit the Dockerfile that produced this image, along with 
this file, go to
[https://github.com/dtenenba/bioc_docker/tree/master/bioconductor.org](https://github.com/dtenenba/bioc_docker/tree/master/bioconductor.org)).

By default (if you don't specify a command to run) the container will build the website.

Then you can find out what port the website is running on with the command:

    docker port website

This will show something like:

    3000/tcp -> 0.0.0.0:49153

The port number that's not 3000 (in this case 49153) will vary.


Then to get the host, do this:

    echo $DOCKER_HOST

This will show something like:

    tcp://192.168.59.103:2376


If using docker directly (not via boot2docker) the IP address shown will be 127.0.0.1.


So in this case you could browse to 

    http://192.168.59.103:49153

to see the compiled site.


If you want to build and view package landing pages, stop the container and restart it like this:

    docker run --rm --name website -P -v `pwd`/bioconductor.org/bioconductor.org \
    rake get_json && rake && adsf -r output 



# TODOS

* enable dashboard to be built
