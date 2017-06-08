FROM ruby:2.2-slim

RUN apt-get update && \
    apt-get install -yq \
    git build-essential ca-certificates \
    libcurl3-dev mysql-client imagemagick \
    libmagickcore-dev libmagickwand-dev \
    libmysqlclient-dev nodejs && \
    rm -rf /var/lib/apt/lists/*
