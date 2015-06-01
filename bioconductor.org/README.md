# A Docker container that builds and runs the Bioconductor website

In order to run this, you need to check out the website code from SVN
(https://hedgehog.fhcrc.org/bioconductor/trunk/bioconductor.org) or github
(https://github.com/Bioconductor/bioconductor.org.git). Assuming you 
check it out into the current directory, this will put the code in 
a directory called bioconductor.org. If you already have a working
copy elsewhere on your disk, you can just provide the full path
to it on the command line(s) below.

## Prerequisites

On Linux, you need Docker 
[installed](https://docs.docker.com/installation/) and
on [Mac](http://docs.docker.com/installation/mac/)
or [Windows](http://docs.docker.com/installation/windows/)
you need boot2docker installed and running.

## Using the container

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

Then you can determine the URL where the website is running with the 
[get_url.sh](../get_url.sh) script. On a Mac you can pass a URL to `open` to open it with
the default browser:

    open `../get_url.sh`

On Linux you can open a specific browser on the command line with a URL, e.g.:

    firefox `../get_url.sh`


If you want to build and view package landing pages, stop the container and restart it like this:

    docker run --rm --name website -P -v `pwd`/bioconductor.org/bioconductor.org \
    rake get_json && rake && adsf -r output 



# TODOS

* enable (all of) dashboard to be built
