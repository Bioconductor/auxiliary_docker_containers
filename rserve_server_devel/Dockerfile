FROM dtenenba/devel_3.1

RUN R -e "biocLite('Rserve')"

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor telnet

EXPOSE 6311

RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY rserve.conf /rserve.conf

CMD ["/usr/bin/supervisord"] 

# Start me like this:

# docker run -d --name server dtenenba/rserve_server_devel

# when done:
# docker rm -f server
