FROM ubuntu:14.04

MAINTAINER dtenenba@fredhutch.org

EXPOSE 3000

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get dist-upgrade -y && apt-get install -y \
    curl g++ libsqlite3-dev make patch python ruby2.0 ruby2.0-dev  rsync

# make ruby 2.0 the default
RUN for i in `ls /usr/bin/*2.0`; do  ln -sf $i `echo $i | tr -d 2.0`  ; done

RUN curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install --upgrade google-api-python-client
RUN pip install python-dateutil

# RUN pip install apiclient? # for dashboard stuff

RUN   cd /tmp && \
    curl -O https://raw.githubusercontent.com/Bioconductor/bioconductor.org/master/Gemfile && \
    curl -O https://raw.githubusercontent.com/Bioconductor/bioconductor.org/master/Gemfile.lock && \
    echo "gem: --no-document" > /etc/gemrc && \
    gem install bundler && \
    bundle install

VOLUME /bioconductor.org

WORKDIR /bioconductor.org

CMD rake && adsf -r output
