FROM postgres

RUN mkdir -p /var/lib/postgres/data/
RUN echo "host all all 0.0.0.0/0 trust" > /var/lib/postgres/data/pg_hba.conf
RUN chown -R postgres /var/lib/postgres

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
