FROM ruby:2.4.1-alpine

# Install system dependencies
RUN apk update && \
    apk add --no-cache \
    tzdata git make \
    build-base bash \
    postgresql-dev \
    imagemagick

ENTRYPOINT ["/bin/sh"]
