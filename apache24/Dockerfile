FROM asteris/apache-php-mongo:latest

RUN a2enmod expires

#ADD MyVhost.conf /etc/apache2/sites-enabled/

RUN rm /run.sh

ADD run.sh /run.sh

CMD ["/run.sh"]

# build me as dtenenba/apache24

# run me like:

# docker run --name apache24 -d -v ~/dev/bioconductor.org/output:/app -p 8010:80 dtenenba/apache24

# if you want to kill apache (to modify its config), do
# killall apache
# ... and then ...
# source /etc/apache2/envvars &&  apache2 -D FOREGROUND
