# Exploratory Docker containers related to the Bioconductor project


**NOTE**: Containers which will be officially suported can be found at
[https://github.com/Bioconductor/bioc_docker](https://github.com/Bioconductor/bioc_docker
); containers in this repository are not of general interest as they
are for internal Bioconductor projects.

See the README.md file in each directory for more detailed information.

Several of these containers are hosted on Docker Hub (as automated builds)
and can be downloaded with `docker pull`.



### rserve_client_devel and rserve_server_devel

Simple proofs-of-concept for the idea of using an Rserve instance do do some work 
using functions of a package that can take a long time to load. If the instance of
Rserve is already running with the package loaded, then the client can 
send expressions to the server with a very quick response. We use this scenario
in our Galaxy tools when we want them to run a fast calculation, where
the calculation runs much faster than the time it takes to load the packages
necessary to run the calculation. Now that Galaxy supports running tools
inside Docker, this same scenario can still be realized by having the
`rserve_server_devel` container running with the name `server`, then
running the galaxy tool with the added job.conf parameter
`--link server:server` 
(supported in [this changeset](https://bitbucket.org/galaxy/galaxy-central/commits/ebceda0721f3f3215447c19f94525f06f164afd1)).

**TODO**: Add a fig.yml to illustrate use of these containers
(not necessarily in a a Galaxy context).

# Utilities

### ./get_url.sh

When you run a container that exposes a web server, this script will give
you the URL to the server, with the appropriate host and port.

### b2on and b2off

For Mac users of boot2docker.

`b2on` starts the boot2docker vm (if it's not
already on) and sets some environment variables that are required in any shell
where you will be working with Docker. It also adds `[dk]` to the beginning
of your shell prompt to indicate that this has been done.

`b2off` turns off the boot2docker vm, unsets the environment variables,
and returns your shell prompt to normal.

**IMPORTANT**: These scripts need to be run by sourcing them with the `.` command, for example:

    . b2on
    . b2off

If you like, you can add aliases that do this to your `~/.bash_profile`.



# Containers for Internal Use

**NOTE**: The following containers are for internal Bioconductor core team
projects only and would probably not be of interest to the wider Bioconductor 
community.

### support.bioconductor.org

A development environment for the Bioconductor support site.

### bioconductor.org

A development environment for the Bioconductor website.

### tracker.bioconductor.org - 

A development environment for the bioconductor issue tracker. This is in its infancy
and issues may arise.


