FROM eboraas/apache
## build me as dtenenba/apache

RUN a2enmod rewrite

RUN cd /etc/apache2/sites-available && \
    sed -i.bak s'/AllowOverride None/AllowOverride All/g' default
RUN ln -s /etc/apache2/mods-available/expires.load /etc/apache2/mods-enabled/

## run me something like this:
## docker run --name apache -p 8009:80 -v ~/dev/bioconductor.org/output/:/var/www/ -d dtenenba/apache

