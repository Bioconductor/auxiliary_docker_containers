# Dev environment for Bioconductor Issue Tracker

## Prerequisites

* Install Docker and Fig (and boot2docker if you are on mac/windows)
* Install mercurial (and git if you don't already have it)

There are two code bases for the issue tracker project. The first is the actual roundup
package which is stored in a Mercurial repository in SourceForge. Why? Because the 
official Roundup sources are there and this is a fork of them.

In the same directory as this README, clone the roundup repository:

    hg clone http://hg.code.sf.net/u/dtenenba/roundup-bioc roundup

This will produce a *read-only* clone of the roundup code. If you need to be able
to commit and push your changes, contact Dan Tenenbaum.

The second code base is the one that contains the configuration and templates for
the tracker. This code is in github. Clone it into the directory containing this
README, as follows:

    git clone https://github.com/dtenenba/bioc_submit.git

(Note: if you already have either of these clones elsewhere on your system you
can just make symlinks to them here.)

We don't keep config.ini in the bioc_submit repository because the production 
instance of the issue tracker has some special values in this file, and other
values that conflict with the ones used in this dev environment.

You probably won't need to change config.ini, so just make it a symlink:

    cd bioc_submit
    ln -s config.ini.example config.ini
    cd ..

## Using these containers

If you are on a mac or windows, you need to start boot2docker first. 

On all platforms, start the containers with:

    fig up

In another window (where, if you are running Mac or Windows, you need to 
initialize the `$DOCKER_HOST` variable), obtain the URL of the tracker 
by running the `tracker_url.sh` script in this directory:

    ./tracker_url.sh

Open a browser window with the URL produced by that script. You can log in
as the user `admin` with password `foo`.

Note: This tracker sends email to a test email server that does not actually
send any email. You will not receive any emails sent by the container directly
into your inbox, however you can view them by pointing a web
browser at port 1081 of your docker host
(which is `localhost` on Linux, and can be determined with the
`boot2docker ip` command on Mac and Windows.)

## Workflow

Any changes you make to files in `bioc_submit` should be reflected right away.

If you need to change code in `roundup`, you need to reinstall the package after
changing the code. So (assuming the containers are still running from earlier),
open a shell on the web app container by finding its name using the `docker ps -l`
command. It's probably `trackerbioconductororg_web_1`. 

Start a shell like this:

    docker exec -ti trackerbioconductororg_web_1 bash

Once in that shell, you can rebuild the package as follows:

    cd /roundup
    python setup.py install

Then you should be able to see the effect of your changes.
