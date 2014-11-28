FROM ubuntu:14.04

MAINTAINER dtenenba@fredhutch.org

EXPOSE 3000

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get dist-upgrade -y && apt-get install -y \
    g++ libsqlite3-dev make patch ruby ruby-dev # python pip ?

# RUN pip install apiclient? # for dashboard stuff

RUN     gem install --no-ri --no-rdoc nanoc nanoc3 rdiscount rack mime-types haml \
      rack-cache httparty rake sass kramdown mechanize json nokogiri \
      rgl sqlite3 adsf twitter aws-sdk hpricot uuid htmlentities

VOLUME /bioconductor.org

WORKDIR /bioconductor.org

CMD rake && adsf -r output
