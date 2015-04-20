FROM eboraas/apache

RUN a2enmod rewrite

RUN cd /etc/apache2/sites-available && \
    sed -i.bak s'/AllowOverride None/AllowOverride All/g' default
RUN ln -s /etc/apache2/mods-available/expires.load /etc/apache2/mods-enabled/



