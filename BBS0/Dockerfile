# build as dtenenba/bbs0

FROM bioconductor/devel_base

MAINTAINER dtenenba@fredhutch.org

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        python

RUN  useradd -d /home/biocbuild -m -s /bin/bash biocbuild
RUN  useradd -d /home/biocadmin -m -s /bin/bash biocadmin

USER biocadmin

RUN mkdir -p /home/biocadmin/bin && \
  ln -s /usr/local/bin/R /home/biocadmin/bin/R-3.2 && \
  mkdir -p /home/biocadmin/PACKAGES/3.1/bioc/ && \
  cd /home/biocadmin/PACKAGES/3.1/bioc && \
  mkdir -p manuals src/contrib bin/windows/contrib/3.2 \
    bin/macosx/contrib/3.2 bin/macosx/mavericks/contrib/3.2 && cd

USER biocbuild

RUN echo "alias st='cd ~/BBS/3.1/bioc/dockernode &&  . config.sh &&  cd'" > /home/biocbuild/.bash_profile

#RUN mkdir -p ~/public_html/BBS/3.1

#VOLUME /home/biocbuild/public_html/BBS/3.1/bioc

#VOLUME /home/biocbuild/BBS

RUN mkdir -p ~/bbs-3.1-bioc/R/bin
RUN mkdir ~/bbs-3.1-bioc/log
RUN ln -s /usr/local/bin/R ~/bbs-3.1-bioc/R/bin/R

USER root

RUN echo "cd ~/BBS/3.1/bioc/dockernode && . config.sh && cd" > /home/biocbuild/.bash_profile

RUN echo "#!/bin/bash\nsu - biocbuild && bash" > /bin/biocbuild && chmod +x /bin/biocbuild
RUN echo "#!/bin/bash\nsu - biocadmin && bash" > /bin/biocadmin && chmod +x /bin/biocadmin

CMD biocbuild

