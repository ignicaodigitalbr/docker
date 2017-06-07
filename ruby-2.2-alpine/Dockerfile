FROM ruby:2.2-alpine

RUN apk add --no-cache git build-base \
    curl-dev imagemagick-dev mysql-dev \
    libxml2-dev libxslt-dev tzdata nodejs \
    bash

RUN gem install nokogiri \
    -v '1.6.6.2' \
    -- --use-system-libraries

RUN bundle config build.libv8 --with-system-v8
