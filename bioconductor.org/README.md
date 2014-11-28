# A Docker container that builds and runs the Bioconductor website

In order to run this, you need to check out the website code from SVN
(https://hedgehog.fhcrc.org/bioconductor/trunk/bioconductor.org) or github
(https://github.com/Bioconductor/bioconductor.org.git). Assuming you 
check it out into the current directory, this will put the code in 
a directory called bioconductor.org.

In order to run this container, do the following:

(If on linux, you may need to prepend all `docker` commands with `sudo`)

    docker run dtenenba/bioconductor.org --name website -P -v `pwd`/bioconductor.org:/bioconductor.org

The first time this command is run, it will pull down the `dtenenba/bioconductor.org`
image which may take a few moments. 

By default (if you don't specify a command to run) the container will build the website.

Then you can find out what port the website is running on with the command:

    docker port website

Use the port shown (the one that's not 3000).

Say that number is 44444, then you can browse to:

 `http://$DOCKER_HOST:44444` to see the compiled site. 

(The `DOCKER_HOST` environment variable will point to `127.0.0.1` if you are running Docker
directly on your linux box, but it will be a different IP address if you are running
boot2docker on Mac or Windows).

If you want to build package landing pages, stop the container and restart it like this:

    docker run dtenenba/bioconductor.org --name website \
    -P -v `pwd`/bioconductor.org/bioconductor.org rake get_json \
    && rake && adsf -r output 

