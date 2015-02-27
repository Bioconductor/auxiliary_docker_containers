# build as dtenenba/bbs0

FROM bioconductor/devel_base

MAINTAINER dtenenba@fredhutch.org

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl openssh-server python-pip rsync ssh

# ssh stuff
RUN mkdir /var/run/sshd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN pip install ipython

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22

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

RUN mkdir /home/biocbuild/.ssh /home/biocbuild/.BBS
ADD id_rsa /home/biocbuild/.BBS/id_rsa

USER root

ADD id_rsa.pub /home/biocbuild/.ssh/authorized_keys
RUN chown biocbuild:biocbuild /home/biocbuild/.BBS/id_rsa /home/biocbuild/.ssh/authorized_keys

USER biocbuild

#RUN echo "alias st='cd ~/BBS/3.1/bioc/dockernode &&  . config.sh &&  cd'" > /home/biocbuild/.bash_profile

#RUN mkdir -p ~/public_html/BBS/3.1

#VOLUME /home/biocbuild/public_html/BBS/3.1/bioc

#VOLUME /home/biocbuild/BBS

RUN mkdir -p ~/bbs-3.1-bioc/R/bin
RUN mkdir ~/bbs-3.1-bioc/log
RUN ln -s /usr/local/bin/R ~/bbs-3.1-bioc/R/bin/R

USER root

RUN echo "cd ~/BBS/3.1/bioc/dockernode && . config.sh && cd" > /home/biocbuild/.bash_profile

ADD biocbuild /bin/biocbuild
ADD biocadmin /bin/biocadmin

#RUN echo "#!/bin/bash\n /usr/sbin/sshd && su - biocbuild && python -m SimpleHTTPServer 80 > /dev/null 2>&1 &  && bash" > /bin/biocbuild && chmod +x /bin/biocbuild
#RUN echo "#!/bin/bash\nsu - biocadmin && bash" > /bin/biocadmin && chmod +x /bin/biocadmin

CMD biocbuild

