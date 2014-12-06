# Linked Docker containers for developing the Bioconductor Support Site

Consists of two containers, one for the database (just an off-the-shelf
container from Docker Hub) and one for the web app. Fig handles the wiring 
of the two containers together.

To use:

* Install boot2docker if you are on 
  [Mac](https://docs.docker.com/installation/mac/) or
  [Windows](https://docs.docker.com/installation/windows/). This also
  installs Docker.
* [Install Docker](https://docs.docker.com/installation/) if you are
  on linux.
* [Install fig](http://www.fig.sh/install.html)

Then:

    git clone https://github.com/dtenenba/bioc_docker.git
    cd bioc_docker/support.bioconductor.org
    git clone https://github.com/Bioconductor/support.bioconductor.org.git \
        biostar-central

If you are running boot2docker, run `boot2docker start` and set
environment variables as suggested.

Then start the containers with:

    fig up

(*NOTE*: `docker` and `fig` commands may need to be preceded with `sudo`.)

When you see the line 

    web_1 | *** Run a waitress server with biostar.settings.base and DATABASE_NAME=biostar

Then the web app is running. You can connect to it as follows:

* Open another terminal window.
* If you are running boot2docker, run `boot2docker start` and
  set environment variables as suggested.
* Get the site's URL with `../get_url.sh`  

# NOTES

* These containers are for development only and should
  not be used for production. For one thing, the postgres
  container that is used is not very secure (although no 
  ports are open to it on the host).
* Search does not (yet) work. That's because the default 
  configuration uses elasticsearch and haystack which require
  a daemon running (in addition to the web app process) 
  and this is a bit trickier to set up in Docker. It can be done,
  or alternatively the development environment could
  use a different search back end which does not require
  a daemon process. Expect this to be fixed at some point.

