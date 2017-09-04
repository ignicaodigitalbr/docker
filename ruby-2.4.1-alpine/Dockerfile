FROM ruby:2.4.1-alpine

RUN apk update && \
    apk add --no-cache \
    tzdata git make curl \
    build-base bash openssh \
    postgresql \
    postgresql-dev \
    imagemagick \
    python python-dev

RUN python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools awscli boto3==1.3.0 && \
    aws configure set preview.cloudfront true

ENTRYPOINT ["/bin/sh"]
