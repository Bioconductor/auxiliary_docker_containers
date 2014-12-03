FROM ubuntu:14.04

MAINTAINER dtenenba@fredhutch.org

EXPOSE 3000

RUN apt-get install -y thispackagedoesnotexist

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get dist-upgrade -y && apt-get install -y \
    curl g++ libsqlite3-dev make patch python ruby ruby-dev  rsync

RUN curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install --upgrade google-api-python-client
RUN pip install python-dateutil

# RUN pip install apiclient? # for dashboard stuff

RUN     gem install --no-ri --no-rdoc nanoc nanoc3 pry rdiscount rack mime-types haml \
      rack-cache httparty rake sass kramdown mechanize json nokogiri \
      rgl sqlite3 adsf twitter aws-sdk hpricot uuid htmlentities redis

VOLUME /bioconductor.org

WORKDIR /bioconductor.org

CMD rake && adsf -r output
