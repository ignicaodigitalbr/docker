FROM ruby:2

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y mysql-server mysql-client libmysqlclient-dev redis-server --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3306
EXPOSE 6379
