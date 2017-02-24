FROM ruby:2.3

RUN apt-get update -y -qq

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.4" > /etc/apt/sources.list.d/pgdg.list

RUN gpg --keyserver keys.gnupg.net --recv-keys ACCC4CF8
RUN gpg --export --armor ACCC4CF8|apt-key add -

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "/etc/init.d/postgresql start && exit 0" > /etc/rc.local
RUN  /etc/init.d/postgresql start &&\
    su postgres -c "psql --command \"CREATE USER kmbuser with password 'kmbuser';\" " &&\
    su postgres -c "psql --command \"CREATE DATABASE kmb_test with owner kmbuser;\" "

USER postgres

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

EXPOSE 5432


CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]
USER root
