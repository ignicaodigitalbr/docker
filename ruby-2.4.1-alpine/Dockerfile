FROM ruby:2.4.1-alpine

RUN apk update && \
    apk add --no-cache \
    tzdata git make \
    build-base bash openssh \
    postgresql \
    postgresql-dev \
    imagemagick

ENTRYPOINT ["/bin/sh"]
