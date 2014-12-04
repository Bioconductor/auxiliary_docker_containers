FROM postgres

RUN echo "host all all 0.0.0.0/0 trust" >> \
    /var/lib/postgres/data/pg_hba.conf


ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
